//
//  DishListViewController.swift
//  Yummie
//
//  Created by mahmoud yousef on 18/10/2022.
//

import UIKit
import ProgressHUD

class DishListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dishes : [Dish] = []
    var categoryID : String!
    let APICaller: DishesAPIProtocol = DishesAPI()

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        fetchCategoryDishes()
    }
    
    
    private func registerCell(){
        tableView.register(UINib(nibName: DishListTableViewCell.reuseID, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.reuseID)
    }
    
    
    private func fetchCategoryDishes(){
        ProgressHUD.show()
       
        APICaller.fetchCategoryDishes(categoryId: categoryID) { [weak self ] result in
            ProgressHUD.dismiss()
            
            guard let self = self else { return }
            
            switch result{
            case .success(let dishes):
                self.updateUI(dishes: dishes?.data ?? [])
                
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    
    
    private func updateUI(dishes:[Dish]){
        self.dishes = dishes
        DispatchQueue.main.async { self.tableView.reloadData() }
    }
    
}

extension DishListViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return dishes.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.reuseID, for: indexPath) as! DishListTableViewCell
        cell.set(dish: dishes[indexPath.row])
        return cell
    }
    
}


extension DishListViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DishDetailViewController.instatiate()
        vc.dish = dishes[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
