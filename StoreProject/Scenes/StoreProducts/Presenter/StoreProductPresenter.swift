//
//  StoreProductPresenter.swift
//  StoreProject
//
//  Created by Enas Abdallah on 24/09/2021.
//

import Foundation
import RealmSwift

protocol StoreView: class {
    func fetchingDataSuccess()
//    func showError(error: String)
//    func navigateToUserDetailsScreen(user: User)
}

protocol productCellView {
    func displayName(name: String)
    func displayPrice(email: String)
    func displayDescription(address: String)
}

class StoreProductPresenter {
    
    private weak var view: StoreView?
    var notificationToken : NotificationToken?
    var productList : Results<Product>!

    
    init(view: StoreView) {
        self.view = view
    }
    
    func viewDidLoad() {
        getProductsList()
    }
    
    func getProductsList() {
        let realm = RealmService.shared.realm
         productList = realm.objects(Product.self)
        notificationToken = realm.observe({ notification, realm in
            self.view?.fetchingDataSuccess()
        })

    }
    
    func getProductsListCount() -> Int {
        return productList.count
    }
    

    
    func didSelectRow(index: Int) {

    }
    
}
