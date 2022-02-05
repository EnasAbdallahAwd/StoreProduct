//
//  ListOfProductTableViewCell.swift
//  StoreProject
//
//  Created by Enas Abdallah on 24/09/2021.
//

import UIKit

typealias ReusableDataSource = (UICollectionViewDelegate & UICollectionViewDataSource & UICollectionViewDelegateFlowLayout)

class ListOfProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!

    var listOfProductDataSource: ReusableDataSource! {
        didSet {
            collectionView.delegate = listOfProductDataSource
            collectionView.dataSource = listOfProductDataSource
            collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        collectionView.register(nibWithCellClass: ListOfOroductCollectionViewCell.self)
    }
    
}
