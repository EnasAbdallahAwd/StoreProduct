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
    
    
    
}
