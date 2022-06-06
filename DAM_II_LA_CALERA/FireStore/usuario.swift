//
//  FirestoreData.swift
//  DAM_II_LA_CALERA
//
//  Created by Pablo Gibbons on 28/11/21.
//

import Foundation

struct User: Identifiable {
    var name: String
    var lastname: String
    var email: String
    var dni: String
    var id: String = UUID().uuidString
}
