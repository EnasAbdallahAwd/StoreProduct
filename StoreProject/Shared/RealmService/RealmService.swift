//
//  RealmService.swift
//  StoreProject
//
//  Created by Enas Abdallah on 24/09/2021.
//

import RealmSwift

protocol ReadableStorage {
    func create<T: Object>(_ object:T) throws
    func update<T: Object>(_ object:T , with dictionary: [String:Any?]) throws
    func delete<T: Object>(_ object:T) throws
    func fetchWithFilter(name:String) -> Results<Product>?
}

protocol WritableStorage {
   // func getDataFromDB<T: Object>() -> Results<T>?
    func getDataFromDB() -> Results<Product>?
}

typealias Storage = ReadableStorage & WritableStorage

final class RealmStorage {
    var realm = try? Realm()
}

extension RealmStorage: ReadableStorage {
    
    func create<T: Object>(_ object:T) throws {
        try realm?.write {
            realm?.add(object)
        }
    }
    
    func update<T>(_ object: T, with dictionary: [String : Any?]) throws where T: Object  {
        try realm?.write {
            dictionary.forEach {
                object.setValue($0.value, forKey: $0.key)
            }
        }
    }
    
    func delete<T>(_ object: T) throws where T: Object {
        try realm?.write {
            realm?.delete(object)
        }
    }
    
    func fetchWithFilter(name:String) -> Results<Product>?   {
        let result = realm?.objects(Product.self).filter("name = %@", name )
        return result
    }
}

extension RealmStorage: WritableStorage {
  
//    func getDataFromDB<T>() -> Results<T>? where T : Object {
//        realm?.objects(Product.self) as? Results<T>
//
//    }
    
    func getDataFromDB() -> Results<Product>? {
        let results: Results<Product>? = realm?.objects(Product.self)
        return results
       }

}

