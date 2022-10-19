//
//  DishListViewController.swift
//  Yummie
//
//  Created by mahmoud yousef on 18/10/2022.
//

import UIKit

class DishListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dishes : [Dish] = [
        .init(id: "id1", name: "Garri", description: "This is the best i have ever tasted.", image: "https://picsum.photos/100/200", calories: 20.352),
        .init(id: "id1", name: "Garri", description: "This is the best i have ever tasted.", image: "https://picsum.photos/100/200", calories: 20.352),
        .init(id: "id1", name: "Garri", description: "This is the best i have ever tasted.", image: "https://picsum.photos/100/200", calories: 20.352),
        .init(id: "id1", name: "Garri", description: "This is the best i have ever tasted.", image: "https://picsum.photos/100/200", calories: 20.352),
        .init(id: "id1", name: "Garri", description: "This is the best i have ever tasted.", image: "https://picsum.photos/100/200", calories: 20.352),
        .init(id: "id1", name: "Garri", description: "This is the best i have ever tasted.", image: "https://picsum.photos/100/200", calories: 20.352),
        .init(id: "id1", name: "Garri", description: "This is the best i have ever tasted.", image: "https://picsum.photos/100/200", calories: 20.352),
        .init(id: "id1", name: "Garri", description: "This is the best i have ever tasted.", image: "https://picsum.photos/100/200", calories: 20.352),
        .init(id: "id1", name: "Garri", description: "This is the best i have ever tasted.", image: "https://picsum.photos/100/200", calories: 20.352),
        .init(id: "id1", name: "Garri", description: "This is the best i have ever tasted.", image: "https://picsum.photos/100/200", calories: 20.352),
        .init(id: "id1", name: "Garri", description: "This is the best i have ever tasted.", image: "https://picsum.photos/100/200", calories: 20.352),
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
    }
    
    
    private func registerCell(){
        tableView.register(UINib(nibName: DishListTableViewCell.reuseID, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.reuseID)
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
