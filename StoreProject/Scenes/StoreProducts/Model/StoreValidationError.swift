//
//  StoreValidationError.swift
//  StoreProject
//
//  Created by Enas Abdallah on 25/09/2021.
//

import Foundation


enum StoreValidationError: LocalizedError {
    
    case productName , productDescription , productPrice, productImage
    var localizedDescription: String {
        switch self {
        
        case .productName:
            return "enter product name"
        case .productDescription:
            return "enter product descriptions"
        case .productPrice:
            return "enter product price"
        case .productImage:
            return "select product image"
    
        }
    }
}

