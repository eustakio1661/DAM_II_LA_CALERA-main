//
//  AuthManager.swift
//  DAM_II_LA_CALERA
//
//  Created by Pablo Gibbons on 28/11/21.
//

import Foundation
import Firebase

public func logOut(completion: (Bool) -> Void) {
    do {
        try Auth.auth().signOut()
        completion(true)
        return
    }
    catch {
        print(error)
        completion(false)
        return
    }
} // End logOut method
