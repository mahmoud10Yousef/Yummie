//
//  DishListTableViewCell.swift
//  Yummie
//
//  Created by mahmoud yousef on 18/10/2022.
//

import UIKit
import Kingfisher

class DishListTableViewCell: UITableViewCell {
    
    static let reuseID = String(describing: DishListTableViewCell.self)
    
    @IBOutlet weak var dishImageView  : UIImageView!
    @IBOutlet weak var dishTitleLBl   : UILabel!
    @IBOutlet weak var descriptionLbl : UILabel!
    
    
    func set( dish:Dish){
        dishImageView.kf.setImage(with: dish.image?.asURL)
        dishTitleLBl.text   = dish.name
        descriptionLbl.text = dish.description
    }
    
    func set(order: Order){
        dishImageView.kf.setImage(with: order.dish?.image?.asURL)
        dishTitleLBl.text   = order.name
        descriptionLbl.text = order.dish?.description
    }
    
}
