//
//  RealmService.swift
//  StoreProject
//
//  Created by Enas Abdallah on 24/09/2021.
//

import RealmSwift
import Realm


class RealmService {
    
    private init() {}
    
    static let shared = RealmService()
    
    var realm = try? Realm()
    
    func create<T: Object>(_ object:T) {
       
        do {
            try realm?.write {
                realm?.add(object)
            }
        } catch {
            post(error)

        }
    }
    
    func getDataFromDB() ->   Results<Product> {
        let results: Results<Product>? = realm?.objects(Product.self)
        return results!
       }

    
    
    func update<T: Object>(_ object:T , with dictionary: [String:Any?]) {
        
        do {
            try realm?.write {
                for (key ,value) in dictionary {
                    object.setValue(value, forKey: key)
                }
            }
        } catch {
           post(error)
        }
    }
    
    
    
    func delete<T: Object>(_ object:T) {
      
        do {
            try realm?.write {
                realm?.delete(object)
            }
        } catch {
           post(error)
        }
    }
    
    
    
    func post(_ error:Error) {
        NotificationCenter.default.post(name: NSNotification.Name("realmError"), object: error)
    }
    
    func observeRealmError(in vc:UIViewController , completion:@escaping (Error?) -> Void) {
        NotificationCenter.default.addObserver(forName:  NSNotification.Name("realmError"), object: nil, queue: nil){ (notification) in
            completion(notification.object as? Error)
        }
    }
    
    func stopObserveRealmError(in vc:UIViewController , completion:@escaping (Error?) -> Void) {
        NotificationCenter.default.removeObserver(vc, name: NSNotification.Name("realmError"), object: nil)
        }
    }
    

