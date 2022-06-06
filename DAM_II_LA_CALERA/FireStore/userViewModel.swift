//
//  userViewModel.swift
//  DAM_II_LA_CALERA
//
//  Created by Pablo Gibbons on 28/11/21.
//

import Foundation

import Foundation
import FirebaseFirestore

class userViewModel: ObservableObject {
    
    @Published var users = [User]()
    
    private var db = Firestore.firestore()
    
    func fetchData() {
        db.collection("users").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.users = documents.map { (queryDocumentSnapshot) -> User in
            let data = queryDocumentSnapshot.data()
            let name = data["name"] as? String ?? ""
            let lastname = data["lastname"] as? String ?? ""
            let email = data["email"] as? String ?? ""
            let dni = data["dni"] as? String ?? ""
            return User(name: name, lastname: lastname, email: email, dni: dni)
            }
        }
    }
}
