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

    
    var presenter: AddProducrtPresenter!
    var product = Product()
    var selectedImage: UIImage?
    lazy var imagesPicker: UIImagePickerController = {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        return picker
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = AddProducrtPresenter(view: self)
        presenter.showProductDetails(product: product)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.parent?.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.title = "Add New Product"
    }
    
    @IBAction private func addProductButtonWasPressed(_ sender: Any) {
        
        self.presenter.addProduct(productName: productNameTextField.text ?? "", productDescription: productDescriptionTextField.text ?? "", productPrice: productPriceTextField.text ?? "", productImage: selectedImage ?? UIImage(), product: product)
       
    }
    
    @IBAction private func addProductImageButtonWasPressed(_ sender: Any) {
        present(imagesPicker, animated: true, completion: nil)
    }
  

    func displayProductDetails(name: String , description:String , price:String) {
        productNameTextField.text = name
        productDescriptionTextField.text = description
        productPriceTextField.text = price
  
    }
    
    
}

extension AddProductViewController:addProductView {
   
    
    func showProductDetails(product: Product) {
        displayProductDetails(name: product.name, description: product.descriptions , price: "$\(product.Price)")

    }
    
    func addProductSucessfully() {
        self.backPressed()
    }
    
    func showMessage(message: String) {
        self.displayMyAlertMessage(userMessage: message)
    }
}



extension AddProductViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        
        if let editedImage = info[.editedImage] as? UIImage {
            selectedImage = editedImage
        } else if let originalImage = info[.originalImage] as? UIImage {
            selectedImage = originalImage
        }
        productImageView.image = selectedImage
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
