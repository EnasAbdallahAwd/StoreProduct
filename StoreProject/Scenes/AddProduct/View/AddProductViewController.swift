//
//  AddProductViewController.swift
//  StoreProject
//
//  Created by Enas Abdallah on 23/09/2021.
//

import UIKit
import SkyFloatingLabelTextField
import RealmSwift

class AddProductViewController: UIViewController {

    @IBOutlet weak var productNameTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var productDescriptionTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var productPriceTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var productImageView: UIImageView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)

    }
    
    @IBAction private func addProductButtonWasPressed(_ sender: Any) {
       
        let newProduct = Product(name: productNameTextField.text ?? "" , descriptions: productDescriptionTextField.text ?? "", Price: productPriceTextField.text ?? "")
        RealmService.shared.create(newProduct)
    }
    
    @IBAction private func addProductImageButtonWasPressed(_ sender: Any) {
     
      
       
    }
  

}
