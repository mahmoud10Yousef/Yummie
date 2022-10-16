//
//  CategoryCollectionViewCell.swift
//  Yummie
//
//  Created by mahmoud yousef on 15/10/2022.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let reusueID = String(describing: CategoryCollectionViewCell.self)
    
    @IBOutlet weak var categoryImageView : UIImageView!
    @IBOutlet weak var categoryTitleLbl  : UILabel!
    
    
    func set(_ dish: DishCategory){
        categoryImageView.kf.setImage(with: dish.image.asURL)
        categoryTitleLbl.text = dish.name
    }
    
}
