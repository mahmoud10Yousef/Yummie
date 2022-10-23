//
//  OrderListViewController.swift
//  Yummie
//
//  Created by mahmoud yousef on 18/10/2022.
//

import UIKit

class OrderListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let orders: [Order] = [
        .init(id: "id1", name: "mahmoud yousef", dish: .init(id: "id1", name: "Garri", description: "This is the best i have ever tasted.", image: "https://picsum.photos/100/200", calories: 20)),
        .init(id: "id1", name: "mahmoud yousef", dish: .init(id: "id1", name: "Garri", description: "This is the best i have ever tasted.", image: "https://picsum.photos/100/200", calories: 20)),
        .init(id: "id1", name: "mahmoud yousef", dish: .init(id: "id1", name: "Garri", description: "This is the best i have ever tasted.", image: "https://picsum.photos/100/200", calories: 20)),
        .init(id: "id1", name: "mahmoud yousef", dish: .init(id: "id1", name: "Garri", description: "This is the best i have ever tasted.", image: "https://picsum.photos/100/200", calories: 20)),
        .init(id: "id1", name: "mahmoud yousef", dish: .init(id: "id1", name: "Garri", description: "This is the best i have ever tasted.", image: "https://picsum.photos/100/200", calories: 20)),
        .init(id: "id1", name: "mahmoud yousef", dish: .init(id: "id1", name: "Garri", description: "This is the best i have ever tasted.", image: "https://picsum.photos/100/200", calories: 20)),
        .init(id: "id1", name: "mahmoud yousef", dish: .init(id: "id1", name: "Garri", description: "This is the best i have ever tasted.", image: "https://picsum.photos/100/200", calories: 20)),
        .init(id: "id1", name: "mahmoud yousef", dish: .init(id: "id1", name: "Garri", description: "This is the best i have ever tasted.", image: "https://picsum.photos/100/200", calories: 20)),
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
    }
  
   
    
    private func registerCells(){
        tableView.register(UINib(nibName: DishListTableViewCell.reuseID, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.reuseID)
        
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
