//
//  StoreProduct+PresenterDelegete.swift
//  StoreProject
//
//  Created by Enas Abdallah on 24/09/2021.
//

import Foundation

extension StoreProductsViewController : StoreView {
    
    func fetchingDataSuccess() {
        self.tableView.reloadData()
    }
    
    func presentProductDetailsScreen(product: Product) {
        let vc = Storyboard.Main.viewController(ProductDetailsViewController.self)
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        vc.definesPresentationContext = true
        vc.product = product
        vc.storeProductsViewController = self
        self.present(vc, animated: true, completion: nil)
    }
    
    func ShowAddNewProductScreen() {
        self.navigationController?.pushViewController(Storyboard.Main.viewController(AddProductViewController.self), animated: true)
    }
    
    func ShowFilterProductScreen() {
        let vc = Storyboard.Main.viewController(FilterProductsViewController.self)
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        vc.definesPresentationContext = true
        self.present(vc, animated: true, completion: nil)
    }
    
   
    
}
