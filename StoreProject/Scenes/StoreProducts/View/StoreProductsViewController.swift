//
//  StoreProductsViewController.swift
//  StoreProject
//
//  Created by Enas Abdallah on 24/09/2021.
//

import UIKit

class StoreProductsViewController: UIViewController {
   
    @IBOutlet weak var tableView: UITableView!

    var presenter: StoreProductPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter = StoreProductPresenter(view: self)
        presenter.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)

    }

}


extension StoreProductsViewController: UITableViewDataSource, UITableViewDelegate {
    
   private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(nibWithCellClass: ListOfProductTableViewCell.self)
        tableView.register(nibWithCellClass: StoreProductMainTableViewCell.self)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return indexPath.section == 0 ?  makeStoreProductMainCell(tableView, indexPath) : makeListOfProductCell(tableView, indexPath)
    }
    
    
    private func makeStoreProductMainCell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as StoreProductMainTableViewCell
      
        cell.addProductAction = {
            self.navigationController?.pushViewController(Storyboard.Main.viewController(AddProductViewController.self), animated: true)
        }
        
        cell.filterProductAction = {
            let filterProductsViewController = Storyboard.Main.viewController(FilterProductsViewController.self)
            self.navigationController?.pushViewController(filterProductsViewController, animated: true)
        }
        
        return cell
    }
    
    private func makeListOfProductCell(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as ListOfProductTableViewCell
        let dataSource = ListOfProductDataSource()
        cell.listOfProductDataSource = dataSource
        dataSource.didSelectProduct = { [weak self]  in
            let productDetailsViewController = Storyboard.Main.viewController(ProductDetailsViewController.self)
            self?.navigationController?.pushViewController(productDetailsViewController, animated: true)
            
        }
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 195 : CGFloat((self.presenter.getProductsListCount() + 3) / 2 * 170)
    }
    
}
