//
//  CategoryCollectionViewCell.swift
//  Yummie
//
//  Created by mahmoud yousef on 15/10/2022.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell ,DishCellView {
   
    static let reusueID = String(describing: CategoryCollectionViewCell.self)
    
    @IBOutlet weak var categoryImageView : UIImageView!
    @IBOutlet weak var categoryTitleLbl  : UILabel!
    
    
    func displayTitle(title: String) {
        categoryTitleLbl.text = title
    }
        
    func displayImage(url: String) {
        categoryImageView.kf.setImage(with: url.asURL)
    }
    
}
