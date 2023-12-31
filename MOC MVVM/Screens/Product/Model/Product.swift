//
//  Product.swift
//  MOC MVVM
//
//  Created by Manu on 29/07/23.
//

import Foundation
struct Product: Decodable{
    let id: Int
    let title: String
    let price: Float
    let description: String
    let category: String
    let image: String
    let rating: Rating
}

struct Rating: Decodable{
    let rate: Float
    let count: Int
}
