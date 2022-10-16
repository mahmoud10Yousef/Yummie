//
//  DishLandscapeCollectionViewCell.swift
//  Yummie
//
//  Created by mahmoud yousef on 15/10/2022.
//

import UIKit
import Kingfisher
class DishLandscapeCollectionViewCell: UICollectionViewCell {

    static let reuseID = String(describing: DishLandscapeCollectionViewCell.self)
    
    @IBOutlet weak var dishImageView  : UIImageView!
    @IBOutlet weak var titleLbl       : UILabel!
    @IBOutlet weak var caloriesLbl    : UILabel!
    @IBOutlet weak var descriptionLbl : UILabel!
    
    func set(_ dish:Dish){
        dishImageView.kf.setImage(with: dish.image?.asURL)
        titleLbl.text       = dish.name
        caloriesLbl.text    = dish.formattedCalories
        descriptionLbl.text = dish.description
    }
}
