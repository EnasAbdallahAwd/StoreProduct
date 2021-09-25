//
//  listOfProductDataSource.swift
//  StoreProject
//
//  Created by Enas Abdallah on 24/09/2021.
//

import UIKit
import RealmSwift

final class ListOfProductDataSource: NSObject {
    var presenter: StoreProductPresenter!
}

extension ListOfProductDataSource: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.presenter.getProductsListCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as ListOfOroductCollectionViewCell
        presenter.configure(cell: cell, for: indexPath.row)
       return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.didSelectRow(index: indexPath.row)
    }
    
}

extension ListOfProductDataSource: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 170)
    }
    
}
