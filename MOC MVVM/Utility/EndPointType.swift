//
//  EndPointType.swift
//  MOC MVVM
//
//  Created by Manu on 29/07/23.
//

import Foundation
enum HTTPMethods: String{
    case get = "GET"
    case post = "POST"
}

protocol EndPointType{
    var path: String { get }
    var baseURL: String { get }
    var url: URL? { get }
    var method: HTTPMethods { get }
}

enum EndPoinItems{
    case products
}

//https://fakestoreapi.com/products
extension EndPoinItems: EndPointType{
    var path: String {
        switch self {
        case .products:
            return "products"
        }
    }
    
    var baseURL: String {
        return "https://fakestoreapi.com/"
    }
    
    var url: URL? {
        return URL(string: "\(baseURL + path)")
    }
    
    var method: HTTPMethods {
        switch self {
        case .products:
            return .get
        }
    }
    
    
}
