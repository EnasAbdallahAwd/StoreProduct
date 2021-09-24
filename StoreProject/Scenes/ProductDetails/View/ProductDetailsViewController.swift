//
//  ProductDetailsViewController.swift
//  StoreProject
//
//  Created by Enas Abdallah on 23/09/2021.
//

import UIKit

class ProductDetailsViewController: UIViewController {

    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productDescriptionLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction private func editProductButtonWasPressed(_ sender: Any) {
       
    }
    
    @IBAction private func deleteProductImageButtonWasPressed(_ sender: Any) {
       
    }

}
