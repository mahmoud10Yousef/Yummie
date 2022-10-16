//
//  HomeViewController.swift
//  Yummie
//
//  Created by mahmoud yousef on 15/10/2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    var categories:[DishCategory] = [
        .init(id: "id 1", name: "Africa Dish1", image: "https://picsum.photos/100/200"),
        .init(id: "id 2", name: "Africa Dish1", image: "https://picsum.photos/100/200"),
        .init(id: "id 3", name: "Africa Dish1", image: "https://picsum.photos/100/200"),
        .init(id: "id 4", name: "Africa Dish1", image: "https://picsum.photos/100/200"),
        .init(id: "id 5", name: "Africa Dish1", image: "https://picsum.photos/100/200"),
        .init(id: "id 5", name: "Africa Dish1", image: "https://picsum.photos/100/200"),
        .init(id: "id 5", name: "Africa Dish1", image: "https://picsum.photos/100/200"),
        .init(id: "id 5", name: "Africa Dish1", image: "https://picsum.photos/100/200"),
        .init(id: "id 5", name: "Africa Dish1", image: "https://picsum.photos/100/200"),
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        
    }
    
    
    private func registerCells(){
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.reusueID, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.reusueID)
    }
    

}

extension HomeViewController: UICollectionViewDelegate{
    
}

extension HomeViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.reusueID, for: indexPath) as! CategoryCollectionViewCell
        cell.set(categories[indexPath.item])
        return cell
    }
    
    
}
