//
//  listOfProductDataSource.swift
//  StoreProject
//
//  Created by Enas Abdallah on 24/09/2021.
//

import UIKit
import RealmSwift

final class ListOfProductDataSource: NSObject {
    var productList : Results<Product>!
    var didSelectProduct: (()-> Void)?
}

extension ListOfProductDataSource: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as ListOfOroductCollectionViewCell
       return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectProduct?()

    }
    
}

extension ListOfProductDataSource: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 170)
    }
    
}
