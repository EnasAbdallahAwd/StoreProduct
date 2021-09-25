//
//  FilterProductsViewController.swift
//  StoreProject
//
//  Created by Enas Abdallah on 24/09/2021.
//

import UIKit

class FilterProductsViewController: UIViewController {
    
    @IBOutlet weak var mainView: UIView!
    
    var filterProductPresenter: FilterProductPresenter?
    weak var  storeProductsViewController: StoreProductsViewController?
    var product = Product()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        filterProductPresenter = FilterProductPresenter(view: self)
        filterProductPresenter?.viewDidLoad()

    }
    

    @IBAction private func filterProductButtonWasPressed(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
        
    }
    
    @IBAction private func resetProductButtonWasPressed(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
        
    }
  
}

extension FilterProductsViewController : FilterProductView {
    func setupViews(product: Product) {
        addBlurinng()
        mainView.roundCornersWithMask([.topLeading ,.topTrailing], radius: 51)

    }
}
