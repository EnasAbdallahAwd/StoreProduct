//
//  UITableView+Register.swift
//  StoreProject
//
//  Created by Enas Abdallah on 23/09/2021.
//


import UIKit
import SwifterSwift

extension UITableView {
    
    func registerHeader<T: UITableViewHeaderFooterView> (nibWithViewClass: T.Type) {
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forHeaderFooterViewReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueHeader<T: UITableViewHeaderFooterView>(forIndexPath indexPath: IndexPath) -> T {
        let cell = dequeueReusableHeaderFooterView(withClass: T.self)
        return cell
    }
    
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }
        
        return cell
    }
}
