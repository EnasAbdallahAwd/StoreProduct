//
//  StoreProductPresenter.swift
//  StoreProject
//
//  Created by Enas Abdallah on 24/09/2021.
//

import RealmSwift

protocol StoreView: AnyObject {
    func fetchingDataSuccess()
    func presentProductDetailsScreen(product: Product)
    func ShowAddNewProductScreen()
    func ShowFilterProductScreen()

}

protocol productCellView {
    func displayName(name: String)
    func displayPrice(email: String)
    func displayDescription(address: String)
}

class StoreProductPresenter {
    
    private weak var view: StoreView?
    var notificationToken : NotificationToken?

    
    init(view: StoreView) {
        self.view = view
    }
    
    func viewDidLoad() {
        getProductsList()
    }
    
    func getProductsList() {
        self.view?.fetchingDataSuccess()
        print(RealmService.shared.getDataFromDB())
    }
    
    func getProductsListCount() -> Int {
        return RealmService.shared.getDataFromDB().count
    }
    
    
    func configure(cell: ListOfOroductCollectionViewCell, for index: Int) {
        let product = RealmService.shared.getDataFromDB() [index] as Product
        cell.displayproductName(name: product.name)
        cell.displayProductDescription(description: product.descriptions)
        cell.displayproductPrice(Price: "$\(product.Price)")
    }

    
    func didSelectRow(index: Int) {
        let product = RealmService.shared.getDataFromDB() [index] as Product
        view?.presentProductDetailsScreen(product: product)

    }
    
    func addNewProduct(){
        view?.ShowAddNewProductScreen()
    }
    
    func filterProduct() {
        view?.ShowFilterProductScreen()
    }
    
}
