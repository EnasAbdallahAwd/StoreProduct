//
//  StoreProductMainTableViewCell.swift
//  StoreProject
//
//  Created by Enas Abdallah on 24/09/2021.
//

import UIKit

class StoreProductMainTableViewCell: UITableViewCell {

    @IBOutlet weak var storeImageView: UIImageView!
    @IBOutlet weak var storeNameLabel: UILabel!
    @IBOutlet weak var storeEmailLabel: UILabel!
    @IBOutlet weak var storelocationLabel: UILabel!
    
    var addProductAction: (( ) -> Void)?
    var filterProductAction: (( ) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   
    @IBAction private func addProductButtonWasPressed(_ sender: UIButton) {
        addProductAction?()
    }
    
    @IBAction private func filterProductButtonWasPressed(_ sender: UIButton) {
        filterProductAction?()
    }
    
    
}
