//
//  PerfilViewController.swift
//  DAM_II_LA_CALERA
//
//  Created by Pablo Gibbons on 28/11/21.
//

import UIKit
import Firebase
import CoreData
import SwiftUI
import FirebaseFirestore

class PerfilViewController: UIViewController {

    @IBOutlet weak var nombreLabel: UILabel!
    @IBOutlet weak var apellidoLabel: UILabel!
    @IBOutlet weak var correoLabel: UILabel!
    @IBOutlet weak var dniLabel: UILabel!
    
    let user = Auth.auth().currentUser
    var documentList: [User] = []
    var db: Firestore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        db = Firestore.firestore()
        getCollection()
    }
    
    private func getCollection() {
          db.collection("usuarios").getDocuments() { (querySnapshot, err) in
              if let err = err {
                  print("Error getting documents: \(err)")
              } else {
                  for document in querySnapshot!.documents {
                      if document.documentID == Auth.auth().currentUser?.uid {
                          print("\(document.documentID) => \(document.data())")
                          
                          let documentList = document.data()
                          let name = documentList["name"] as? String
                          let lastname = documentList["lastname"] as? String
                          let email = documentList["email"] as? String
                          let dni = documentList["dni"] as? String
                          self.nombreLabel.text = String(format: "%@ %@", "Nombre: ", name!)
                          self.apellidoLabel.text = String(format: "%@ %@", "Apellido: ", lastname!)
                          self.correoLabel.text = String(format: "%@ %@", "Correo: ", email!)
                          self.dniLabel.text = String(format: "%@ %@", "DNI: ", dni!)
                      }else{
                         
                      }
                  }
              }
          }
      }

    @IBAction func logout(_ sender: Any) {
        try! Auth.auth().signOut()
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let homeScreen = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
        as!LoginViewController
        homeScreen.modalPresentationStyle = .fullScreen
        self.present(homeScreen, animated: true, completion: nil)
    }
}
