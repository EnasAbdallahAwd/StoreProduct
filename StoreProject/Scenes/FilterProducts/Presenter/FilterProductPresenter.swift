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
    private let cache: RealmStorage

    
    init(view: FilterProductView, cache: RealmStorage = .init() ) {
        self.view = view
        self.cache = cache

    }
    
    func viewDidLoad() {

        view?.setupViews(product: product)

    }
      
    func filterProduct(name: String) {
      let result = cache.fetchWithFilter(name: name)
        print(result)
    }
   
    
}
