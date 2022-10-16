//
//  DishPortraitCollectionViewCell.swift
//  Yummie
//
//  Created by mahmoud yousef on 15/10/2022.
//

import UIKit
import Kingfisher

class DishPortraitCollectionViewCell: UICollectionViewCell {
    
    static let reuseID = String(describing: DishPortraitCollectionViewCell.self)
    
    @IBOutlet weak var titleLbl       : UILabel!
    @IBOutlet weak var dishImageView  : UIImageView!
    @IBOutlet weak var caloriesLbl    : UILabel!
    @IBOutlet weak var descriptionLbl : UILabel!
    
    
    func set(_ dish: Dish){
        dishImageView.kf.setImage(with: dish.image?.asURL)
        titleLbl.text       = dish.name
        descriptionLbl.text = dish.description
        caloriesLbl.text    = dish.formattedCalories
    }
    
}
