//
//  OrderListViewController.swift
//  Yummie
//
//  Created by mahmoud yousef on 18/10/2022.
//

import UIKit
import ProgressHUD

class OrderListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var orders: [Order] = []
    let APICaller: DishesAPIProtocol = DishesAPI()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        fetchOrders()
    }
  
   
    private func registerCells(){
        tableView.register(UINib(nibName: DishListTableViewCell.reuseID, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.reuseID)
        
    }
   
    
    private func fetchOrders(){
        ProgressHUD.show()
        APICaller.fetchOrders { [weak self] result in
            
            ProgressHUD.dismiss()
            guard let self = self else { return }
            
            switch result{
            case .success(let orders):
                self.updateUI(orders: orders?.data ?? [])
                
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    
    
    private func updateUI(orders: [Order]){
        self.orders = orders
        DispatchQueue.main.async { self.tableView.reloadData() }
    }
 
    
}

extension OrderListViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.reuseID, for: indexPath) as! DishListTableViewCell
        cell.set(order: orders[indexPath.row])
        return cell
    }
}


extension OrderListViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DishDetailViewController.instatiate()
        vc.dish = orders[indexPath.row].dish
        navigationController?.pushViewController(vc, animated: true)
    }
}
