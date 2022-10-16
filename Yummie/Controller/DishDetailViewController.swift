//
//  DishDetailViewController.swift
//  Yummie
//
//  Created by mahmoud yousef on 15/10/2022.
//

import UIKit
import Kingfisher

class DishDetailViewController: UIViewController {
    
    
    @IBOutlet weak var dishImageView: UIImageView!
    
    @IBOutlet weak var titleLbl      : UILabel!
    @IBOutlet weak var caloriesLbl   : UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var nameField     : UITextField!
    
    var dish: Dish!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateData()
    }
    
    
    private func populateData(){
        titleLbl.text       = dish.name
        caloriesLbl.text    = dish.formattedCalories
        descriptionLbl.text = dish.description
        dishImageView.kf.setImage(with: dish.image?.asURL)
    }

    @IBAction func placeOrderBtnClicked(_ sender: Any) {
    }
}
