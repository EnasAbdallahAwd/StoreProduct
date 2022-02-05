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
    
    var presenter: AddProductPresenter?
    var product = Product()
    var selectedImage: NSData?
    
    lazy var imagesPicker: UIImagePickerController = {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        return picker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = AddProductPresenter(view: self)
        presenter?.showProductDetails(product: product)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.title = "Add New Product"
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction private func addProductButtonWasPressed(_ sender: Any) {
        
        presenter?.addProduct(productName: productNameTextField.text ?? "", productDescription: productDescriptionTextField.text ?? "", productPrice: productPriceTextField.text ?? "", productImage: selectedImage ?? NSData() , product: product)
       
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

extension AddProductViewController: addProductView {

    func showProductDetails(product: Product) {
        displayProductDetails(name: product.name, description: product.descriptions , price: "$\(product.Price)")
    }
    
    func addProductSuccessfully() {
        backPressed()
    }
    
    func showMessage(message: String) {
        displayMyAlertMessage(userMessage: message)
    }
}



extension AddProductViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        
        if let editedImage = info[.editedImage] as? UIImage {
//            selectedImage = editedImage
            productImageView.image = editedImage
            let data = NSData(data: editedImage.jpegData(compressionQuality: 0.9)!)
            self.selectedImage = data

        } else if let originalImage = info[.originalImage] as? UIImage {
//            selectedImage = originalImage
            productImageView.image = originalImage
            let data = NSData(data: originalImage.jpegData(compressionQuality: 0.9)!)
            self.selectedImage = data
        }
        
        
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
