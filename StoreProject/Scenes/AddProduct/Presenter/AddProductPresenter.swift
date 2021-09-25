//
//  AddProductPresenter.swift
//  StoreProject
//
//  Created by Enas Abdallah on 25/09/2021.
//

import UIKit

protocol addProductView: AnyObject {
    
    func addProductSucessfully()
    func showMessage(message:String)
    func showProductDetails(product:Product)
}


class AddProducrtPresenter {
    
    private weak var view: addProductView?
    
    
    init(view: addProductView) {
        self.view = view
    }
    
    
    private func validateData(with productName: String?, productDescription: String?, productPrice: String? , productImage:UIImage? ) throws -> (productName: String, productDescription: String ,productPrice:String ) {
        
        guard let productName = productName, !productName.isEmpty else { throw StoreValidationError.productName }
        guard let productDescription = productDescription, !productDescription.isEmpty else { throw StoreValidationError.productDescription }
        guard let productPrice = productPrice, !productPrice.isEmpty else { throw StoreValidationError.productPrice }
//        guard  productImage != nil else { throw StoreValidationError.productImage }
        
        return (productName, productDescription ,productPrice)
    }
    
    
    func addProduct (productName: String, productDescription: String, productPrice: String ,productImage:UIImage , product:Product) {
        
        do {
            let productData = try validateData(with: productName, productDescription: productDescription, productPrice: productPrice, productImage: productImage )
           print(productData)
            let newProduct = Product(name:productData.productName , descriptions: productData.productDescription , Price: productData.productPrice )
            
            if product.name != "" {
                let dict : [String: Any?] = ["name" : productData.productName , "descriptions" : productData.productDescription , "Price" : productData.productPrice] 
                RealmService.shared.update(product, with: dict)
                
            } else {
                RealmService.shared.create(newProduct)

            }
            
            self.view?.addProductSucessfully()

           
            
        } catch {
            if let error = error as? StoreValidationError {
                print(error.localizedDescription)
                self.view?.showMessage(message: error.localizedDescription)
            } else {
                self.view?.showMessage(message: error.localizedDescription)
                print(error.localizedDescription.localized)
                
            }
        }
    }
    
    
    func  showProductDetails(product:Product){
        self.view?.showProductDetails(product: product)
    }
    
    
    
}
