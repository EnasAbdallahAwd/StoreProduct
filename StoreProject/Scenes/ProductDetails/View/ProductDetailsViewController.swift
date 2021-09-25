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
    @IBOutlet weak var mainView: UIView!
    
    
    var productDetailsPresenter: ProductDetailsPresenter?
    weak var  storeProductsViewController: StoreProductsViewController?
    var product = Product()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productDetailsPresenter = ProductDetailsPresenter(view: self)
        productDetailsPresenter?.product = product
        productDetailsPresenter?.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    @IBAction private func editProductButtonWasPressed(_ sender: Any) {
        editProductCell(product: product)
    }
    
    @IBAction private func deleteProductImageButtonWasPressed(_ sender: Any) {
        deleteProductCell(product: product)
    }
    
    
    func displayproductDetails(name: String , description:String , price:String) {
        productNameLabel.text = name
        productDescriptionLabel.text = description
        productPriceLabel.text = price
  
    }
    
}


extension ProductDetailsViewController: ProductDtailsView {
    
    
    func setupViews(product: Product) {
        mainView.roundCornersWithMask([.topLeading ,.topTrailing], radius: 51)
        addBlurinng()
        displayproductDetails(name: product.name, description: product.descriptions , price: "$\(product.Price)")
    }
    
    func deleteProductCell(product: Product) {
        self.dismiss(animated: false) {
            RealmService.shared.delete(self.product)
            self.storeProductsViewController?.presenter?.viewDidLoad()
        }
    }
    
    func editProductCell(product: Product) {
        self.dismiss(animated: false) {
            
            let addProductViewController = Storyboard.Main.viewController(AddProductViewController.self)
            addProductViewController.product = product
            self.storeProductsViewController?.navigationController?.pushViewController(addProductViewController)
        }
    }
    
}
