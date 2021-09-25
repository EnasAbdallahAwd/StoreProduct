//
//  FilterProductPresenter.swift
//  StoreProject
//
//  Created by Enas Abdallah on 25/09/2021.
//

import Foundation


protocol FilterProductView: AnyObject {
    func setupViews(product: Product)
   

}

class FilterProductPresenter {
    
    private weak var view: FilterProductView?
    var product = Product()

    
    init(view: FilterProductView) {
        self.view = view
    }
    
    func viewDidLoad() {
        print("Product== " ,product)
        view?.setupViews(product: product)

    }
      
   
    
}
