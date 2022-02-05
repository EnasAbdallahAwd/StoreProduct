//
//  NibLoadableView.swift
//  StoreProject
//
//  Created by Enas Abdallah on 23/09/2021.
//


import UIKit

protocol NibLoadableView: class { }

extension NibLoadableView where Self: UIView {
    
    static var nibName: String {
        return String(describing: self)
    }
    
}

extension UITableViewCell: NibLoadableView { }

extension UICollectionReusableView: NibLoadableView { }

extension UITableViewHeaderFooterView: NibLoadableView {}
