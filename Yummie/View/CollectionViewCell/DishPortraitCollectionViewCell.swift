//
//  DishPortraitCollectionViewCell.swift
//  Yummie
//
//  Created by mahmoud yousef on 15/10/2022.
//

import UIKit
import Kingfisher

class DishPortraitCollectionViewCell: UICollectionViewCell , DishCellView {
  
    static let reuseID = String(describing: DishPortraitCollectionViewCell.self)
    
    @IBOutlet weak var titleLbl       : UILabel!
    @IBOutlet weak var dishImageView  : UIImageView!
    @IBOutlet weak var caloriesLbl    : UILabel!
    @IBOutlet weak var descriptionLbl : UILabel!
    
    
    func displayTitle(title: String) {
        titleLbl.text = title
    }
    
    
    func displayImage(url: String) {
        dishImageView.kf.setImage(with: url.asURL)
    }
    
    
    func dispalyCalories(calories: String){
        caloriesLbl.text = calories
    }
    
    
    func displayDescription(description: String) {
        descriptionLbl.text = description
    }
    
    
}
