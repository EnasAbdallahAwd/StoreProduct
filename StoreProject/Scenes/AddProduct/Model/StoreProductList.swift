//
//  StoreProductList.swift
//  StoreProject
//
//  Created by Enas Abdallah on 24/09/2021.
//

import RealmSwift

final class Store: Object {
    @objc dynamic var name = ""
    @objc dynamic var id = ""
    let product = List<Product>()

    override static func primaryKey() -> String? {
        return "id"
    }
}

final class Product: Object {
//    @objc dynamic var id = ""
    @objc dynamic var name = ""
    @objc dynamic var descriptions = ""
    @objc dynamic var Price = ""
    @objc dynamic var imageData: NSData? = nil

   // @objc dynamic var imageData: Data? = nil

//    override static func primaryKey() -> String? {
//        return "id"
//    }
    
    convenience  init(name:String ,descriptions:String ,Price:String ,imageData:NSData) {
        self.init()
        self.name = name
        self.descriptions = descriptions
        self.Price = Price
        self.imageData = imageData
    }

}
