//
//  HomeViewController.swift
//  Yummie
//
//  Created by mahmoud yousef on 15/10/2022.
//

import UIKit
import ProgressHUD

class HomeViewController: UIViewController {
    
    @IBOutlet weak var categoryCollectionView : UICollectionView!
    @IBOutlet weak var popularCollectionView  : UICollectionView!
    @IBOutlet weak var specialsCollectionView : UICollectionView!
    
    private let APICaller: DishesAPIProtocol = DishesAPI()
    
    var categories:[DishCategory] = []
    var populars : [Dish]         = []
    var specials : [Dish]         = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        fetchAllCategories()
    }
    
    
    private func registerCells(){
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.reusueID, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.reusueID)
        popularCollectionView.register(UINib(nibName: DishPortraitCollectionViewCell.reuseID, bundle: nil), forCellWithReuseIdentifier: DishPortraitCollectionViewCell.reuseID)
        specialsCollectionView.register(UINib(nibName: DishLandscapeCollectionViewCell.reuseID, bundle: nil), forCellWithReuseIdentifier:DishLandscapeCollectionViewCell.reuseID)
        
    }
    
    
    private func fetchAllCategories(){
        ProgressHUD.show()
        
        APICaller.fetchAllCategories { [weak self]result in
            guard let self = self else { return }
            ProgressHUD.dismiss()
            
            switch result{
            case .success(let allDishes):
                self.updateUI(dishes: (allDishes?.data)!)
                
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    
    
    private func updateUI(dishes : AllDishes){
        self.categories = dishes.categories ?? []
        self.populars   = dishes.populars ?? []
        self.specials   = dishes.specials ?? []

        DispatchQueue.main.async {
            self.categoryCollectionView.reloadData()
            self.specialsCollectionView.reloadData()
            self.popularCollectionView.reloadData()
        }
    }
    
}

extension HomeViewController: UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView{
            let vc = DishListViewController.instatiate()
            vc.categoryID = self.categories[indexPath.item].id
            navigationController?.pushViewController(vc, animated: true)
        }else{
            let controller = DishDetailViewController.instatiate()
            let dish = collectionView == specialsCollectionView ? specials[indexPath.item] : populars[indexPath.item]
            controller.dish = dish
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
}

extension HomeViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView{
        case categoryCollectionView :
            return categories.count
            
        case popularCollectionView  :
            return populars.count
            
        case specialsCollectionView :
            return specials.count
            
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
            return cell
            
        case specialsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishLandscapeCollectionViewCell.reuseID, for: indexPath) as! DishLandscapeCollectionViewCell
            cell.set(populars[indexPath.item])
            return cell
            
        default :
            return UICollectionViewCell()
        }
        
    }
}
