//
//  ProductListViewController.swift
//  MOC MVVM
//
//  Created by Manu on 29/07/23.
//

import UIKit

class ProductListViewController: UIViewController {

    //MARK: - Outlet
    @IBOutlet weak var productTableView: UITableView!
    private var viewModel = ProductViewModel()
    
    //MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
    }
}


extension ProductListViewController{
    func configuration(){
        productTableView.dataSource = self
        productTableView.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductTableViewCell")
        observeEvent()
        initViewModel()
        
    }
    
    func initViewModel(){
        viewModel.fetchProducts()
    }
    
    func observeEvent(){
        viewModel.eventHandler = {[weak self] event in
            guard let self else { return }
            switch event{
            case .loading:
                print("Product Loading...")
            case .dataLoaded:
                print("Data Loaded...")
                DispatchQueue.main.async {
                    self.productTableView.reloadData()
                }
            case .stopLoading:
                print("Stop Loading...")
            case .error(let error):
                print(error)
                
            }
        }
    }
}


extension ProductListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as? ProductTableViewCell else {
            return UITableViewCell()
        }
        cell.product = viewModel.products[indexPath.row]
        return cell
    }
}
