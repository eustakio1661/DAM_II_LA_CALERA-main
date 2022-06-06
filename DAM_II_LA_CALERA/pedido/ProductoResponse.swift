//
//  ProductoResponse.swift
//  DAM_II_LA_CALERA
//
//  Created by Pablo Gibbons on 27/11/21.
//

import Foundation

struct Producto: Decodable {
    var descriotion: String
    var id: Int
    var name: String
    var type: Int
}
