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
    
    var presenter:HomeVCPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        presenter = HomeVCPresenter(view: self)
        presenter.viewDidLoad()
    }
    
    
    private func registerCells(){
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.reusueID, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.reusueID)
        popularCollectionView.register(UINib(nibName: DishPortraitCollectionViewCell.reuseID, bundle: nil), forCellWithReuseIdentifier: DishPortraitCollectionViewCell.reuseID)
        specialsCollectionView.register(UINib(nibName: DishLandscapeCollectionViewCell.reuseID, bundle: nil), forCellWithReuseIdentifier:DishLandscapeCollectionViewCell.reuseID)
        
    }
    
}


extension HomeViewController : HomeView{
    
    func showLoadingView() {
        ProgressHUD.show()
    }
    
    
    func hideLoadingView() {
        ProgressHUD.dismiss()
    }
    
    
    func fetchingDataSuccessfully() {
        DispatchQueue.main.async {
            self.categoryCollectionView.reloadData()
            self.popularCollectionView.reloadData()
            self.specialsCollectionView.reloadData()
        }
    }
    
    
    func showError(error: String) {
        ProgressHUD.showError(error)
    }
    
}


extension HomeViewController: UICollectionViewDelegate{
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        if collectionView == categoryCollectionView{
//            let vc = DishListViewController.instatiate()
//            vc.categoryID = self.categories[indexPath.item].id
//            navigationController?.pushViewController(vc, animated: true)
//        }else{
//            let controller = DishDetailViewController.instatiate()
//            let dish = collectionView == specialsCollectionView ? specials[indexPath.item] : populars[indexPath.item]
//            controller.dish = dish
//            self.navigationController?.pushViewController(controller, animated: true)
//        }
//    }
}

extension HomeViewController : UICollectionViewDataSource{
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView{
        case categoryCollectionView :
            return presenter.getCountFor(section: .categories)
            
        case popularCollectionView  :
            return presenter.getCountFor(section: .populars)
            
        case specialsCollectionView :
            return presenter.getCountFor(section: .specials)
            
        default :
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case categoryCollectionView :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.reusueID, for: indexPath) as! CategoryCollectionViewCell
            presenter.configure(cell: cell, for: indexPath.row)
            return cell
            
        case popularCollectionView :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishPortraitCollectionViewCell.reuseID, for: indexPath) as! DishPortraitCollectionViewCell
            presenter.configure(cell: cell, for: indexPath.row, section: .populars)
            return cell
            
        case specialsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishLandscapeCollectionViewCell.reuseID, for: indexPath) as! DishLandscapeCollectionViewCell
            presenter.configure(cell: cell, for: indexPath.row, section: .specials)
            return cell
            
        default :
            return UICollectionViewCell()
        }
        
    }
}
