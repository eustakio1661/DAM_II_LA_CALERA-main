//
//  PedidoResponse.swift
//  DAM_II_LA_CALERA
//
//  Created by Pablo Gibbons on 27/11/21.
//

import Foundation

struct PedidoResponse: Decodable {
    var count: Int
    var createDate: String?
    var mcliente: [Client]
}

struct Client: Decodable {
    var documentNumber: String?
    var documentType: Int
    var id: Int
    var lastName: String
    var name: String
}
