//
//  ProductDetailsPresenter.swift
//  StoreProject
//
//  Created by Enas Abdallah on 25/09/2021.
//

import Foundation

protocol ProductDetailsView: AnyObject {
    func setupViews(product: Product)
    func didDeletedProduct()
    func didFailedDeleteProduct()
    func editProductCell(product: Product)

}

final class ProductDetailsPresenter {
    
    private weak var view: ProductDetailsView?
    private let product: Product
    private let cache: RealmStorage
    
    init(
        view: ProductDetailsView,
        product: Product,
        cache: RealmStorage = .init()
    ) {
        self.view = view
        self.product = product
        self.cache = cache
    }
    
    func viewDidLoad() {
        view?.setupViews(product: product)
    }
    
    func deleteProduct(product: Product) {
        do {
            try cache.delete(product)
            view?.didDeletedProduct()
        } catch {
            view?.didFailedDeleteProduct()
        }
    }
    
    func editProduct(product: Product) {
        view?.editProductCell(product: product)

    }
    
}
