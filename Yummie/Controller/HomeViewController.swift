//
//  HomeViewController.swift
//  Yummie
//
//  Created by mahmoud yousef on 15/10/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    
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
    
    var populars : [Dish] = [
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
        registerCells()
    }
    
    
    private func registerCells(){
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.reusueID, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.reusueID)
        popularCollectionView.register(UINib(nibName: DishPortraitCollectionViewCell.reuseID, bundle: nil), forCellWithReuseIdentifier: DishPortraitCollectionViewCell.reuseID)
    }
    
    
}

extension HomeViewController: UICollectionViewDelegate{
    
}

extension HomeViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView{
        case categoryCollectionView :
            return categories.count
        case popularCollectionView  :
            return populars.count
        default :
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case categoryCollectionView :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.reusueID, for: indexPath) as! CategoryCollectionViewCell
            cell.set(categories[indexPath.item])
            return cell
        
        case popularCollectionView :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishPortraitCollectionViewCell.reuseID, for: indexPath) as! DishPortraitCollectionViewCell
            cell.set(populars[indexPath.item])
            print(populars[indexPath.item])
            return cell
            
        default :
            return UICollectionViewCell()
        }
        
    }
}