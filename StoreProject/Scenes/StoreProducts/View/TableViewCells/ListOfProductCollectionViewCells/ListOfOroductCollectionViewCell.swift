//
//  ListOfOroductCollectionViewCell.swift
//  StoreProject
//
//  Created by Enas Abdallah on 24/09/2021.
//

import UIKit

class ListOfOroductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func displayproductName(name: String) {
        productNameLabel.text = name
    }
    
    func displayProductDescription(description: String) {
        productDescriptionLabel.text = description
    }
    
    func displayproductPrice(Price: String) {
        productPriceLabel.text = Price
    }

}
