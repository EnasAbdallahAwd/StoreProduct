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
    private let cache: RealmStorage
    var notificationToken : NotificationToken?

    init(view: StoreView,
         cache: RealmStorage = RealmStorage()) {
        self.view = view
        self.cache = cache
    }
    
    func viewDidLoad() {
        getProductsList()
        
        debugPrint(cache.getDataFromDB())
    }
    
    func getProductsList() {
        self.view?.fetchingDataSuccess()
    }
    
    func getProductsListCount() -> Int {
        return cache.getDataFromDB()?.count ?? 0
    }
    
    
    func configure(cell: ListOfOroductCollectionViewCell, for index: Int) {
        let product = (cache.getDataFromDB()? [index] ?? Product()) as Product
        cell.displayproductName(name: product.name)
        cell.displayProductDescription(description: product.descriptions)
        cell.displayproductPrice(Price: "$\(product.Price)")
    }

    
    func didSelectRow(index: Int) {
        let product = (cache.getDataFromDB()? [index] ?? Product()) as Product
        view?.presentProductDetailsScreen(product: product)

    }
    
    func addNewProduct(){
        view?.ShowAddNewProductScreen()
    }
    
    func filterProduct() {
        view?.ShowFilterProductScreen()
    }
    
}
