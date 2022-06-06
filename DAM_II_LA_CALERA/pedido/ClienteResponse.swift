//
//  ClienteResponse.swift
//  DAM_II_LA_CALERA
//
//  Created by Pablo Gibbons on 27/11/21.
//

import Foundation

struct Cliente: Decodable {
    var documentType: String
    var id: Int
    var lastName: String
    var name: String
}
