//
//  PedidoResponse.swift
//  DAM_II_LA_CALERA
//
//  Created by Pablo Gibbons on 29/11/21.
//

import Foundation

struct DeliveryResponse: Decodable{
    
    var status:String
    var delivery:[Delivery]
    
}

struct Client: Decodable {
    var client: String
    var clientId: Int
    var name: String
    var lastName: String
    var documentNumber:Int
    var documentType:Int
}

struct Product: Decodable{
    //var product: String
    //var productId: Int
    var name: String
    //var type: Int
    //var description: String
}

struct Delivery: Decodable{
    var deliveryId: Int
    var count: Int
    var sessionId: String
    var deliveryAddress: String
    var status: String
    var createDate: String
    //var client: Client
    var product: Product
}





