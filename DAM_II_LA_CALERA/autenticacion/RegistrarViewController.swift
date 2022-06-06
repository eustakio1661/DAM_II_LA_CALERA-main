//
//  RegistrarViewController.swift
//  DAM_II_LA_CALERA
//
//  Created by Pablo Gibbons on 28/11/21.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

class RegistrarViewController: UIViewController {

    @IBOutlet weak var inputTextNombre: UITextField!
    @IBOutlet weak var inputTextApellido: UITextField!
    @IBOutlet weak var inputTextDni: UITextField!
    @IBOutlet weak var inputTextCorreo: UITextField!
    @IBOutlet weak var inputTextClave: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
   
    @IBAction func btnRegistrar(_ sender: Any) {
        let name = inputTextNombre.text!
        let last = inputTextApellido.text!
        let id = inputTextDni.text!
        let email = inputTextCorreo.text!
        let password = inputTextClave.text!
        
        Auth.auth().createUser(withEmail: email, password: password){user, error in
            if let resultCreate = user{
                print(resultCreate.user.uid)
                let alertController = UIAlertController(title: "Aviso", message: "Usuario creado con Éxito", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "Entendido", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
                self.registerFirestore(name: name, lastname: last, email: email, dni: id, uid:resultCreate.user.uid)
            }else{
                let alertController = UIAlertController(title: "Error", message: "Hubo un problema al crear su usuario, favor intente nuevamente", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    func registerFirestore(name: String, lastname: String, email: String, dni: String, uid: String){
        let db = Firestore.firestore()
        db.collection("usuarios").document(uid).setData([
            "name": name,
            "lastname":lastname,
            "email":email,
            "dni":dni
        ]){ error in
            if let er = error {
                print("Registro Firestore Incorrecto \(er)")
            }else{
                print("Registro Firestore Correcto")
            }
        }
    }
}
