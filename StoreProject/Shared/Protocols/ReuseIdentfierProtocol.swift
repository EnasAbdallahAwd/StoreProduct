//
//  ReuseIdentfierProtocol.swift
//  StoreProject
//
//  Created by Enas Abdallah on 23/09/2021.
//


import UIKit

protocol ReusableView: class {}

extension ReusableView where Self: UIView {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
}

extension UITableViewCell: ReusableView {}

extension UICollectionReusableView: ReusableView {}

extension UITableViewHeaderFooterView: ReusableView {}
