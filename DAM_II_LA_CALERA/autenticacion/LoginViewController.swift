//
//  LoginViewController.swift
//  DAM_II_LA_CALERA
//
//  Created by Pablo Gibbons on 4/11/21.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore
import SwiftUI
import CoreData

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var textFieldCorreo: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var btnForgotPassword: UIButton!
    
    var userListCoreData:[NSManagedObject]=[]
    var userList:[NSManagedObject]=[]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldCorreo.delegate = self
        textFieldPassword.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    @IBAction func loginAction(_ sender: Any) {
        
        let correo = textFieldCorreo.text ?? ""
        let password = textFieldPassword.text ?? ""
        
        if correo.isEmpty && password.isEmpty {
            let alertController = UIAlertController(title: "Alerta", message: "Los campos usuario y clave no pueden estar vacíos.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }else {
            Auth.auth().signIn(withEmail: correo, password: password){ result, error in
                if let resultLogin = result {
                    print(resultLogin.user.uid)
                    self.goToMenu()
                }else {
                    let alertController = UIAlertController(title: "Error", message: "El usuario o clave son incorrectos.", preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "Entendido", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    @IBAction func singUpTap(_ sender: Any) {
    
    }
    
    @IBAction func forgotPassTap(_ sender: Any) {
        Auth.auth().sendPasswordReset(withEmail: textFieldCorreo.text!){ error in
            DispatchQueue.main.async {
                if error != nil && self.textFieldCorreo.state.isEmpty{
                    let alertController = UIAlertController(title: "Alerta", message: "Ingrese un correo electrónico", preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "Entendido", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                } else{
                    let alertController = UIAlertController(title: "Aviso", message: "Se envió un enlace a su correo para restablecer su contraseña", preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "Entendido", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    func goToMenu(){
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let homeScreen = storyboard.instantiateViewController(withIdentifier: "MenuViewController")
        as!MenuViewController
        homeScreen.modalPresentationStyle = .fullScreen
        self.present(homeScreen, animated: true, completion: nil)
    }
}
