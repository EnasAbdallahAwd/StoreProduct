//
//  ProductDetailsPresenter.swift
//  StoreProject
//
//  Created by Enas Abdallah on 25/09/2021.
//

import Foundation

protocol ProductDtailsView: AnyObject {
    func setupViews(product: Product)
    func deleteProductCell(product: Product)
    func editProductCell(product: Product)

}

class ProductDetailsPresenter {
    
    private weak var view: ProductDtailsView?
    var product = Product()

    
    init(view: ProductDtailsView) {
        self.view = view
    }
    
    func viewDidLoad() {
        print("Product== " ,product)
        view?.setupViews(product: product)

    }
      
    func deleteProduct(product: Product) {
        view?.deleteProductCell(product: product)

    }
    
    func editProduct(product: Product) {
        view?.editProductCell(product: product)

    }
    
}
