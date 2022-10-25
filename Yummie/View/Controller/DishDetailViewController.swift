//
//  DishDetailViewController.swift
//  Yummie
//
//  Created by mahmoud yousef on 15/10/2022.
//

import UIKit
import Kingfisher
import ProgressHUD

class DishDetailViewController: UIViewController {
    
    
    @IBOutlet weak var dishImageView: UIImageView!
    
    @IBOutlet weak var titleLbl      : UILabel!
    @IBOutlet weak var caloriesLbl   : UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var nameField     : UITextField!
    
    var dish: Dish!
    var APICaller: DishesAPIProtocol = DishesAPI()
    
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
        guard let name = nameField.text?.trimmingCharacters(in: .whitespacesAndNewlines) , !name.isEmpty else {
            ProgressHUD.showError("Please Enter your name")
            return
        }
        
        submitOrder()
        
    }
    
    private func submitOrder(){
        ProgressHUD.show("Placing order...")
        APICaller.placeOrder(dishId: dish.id ?? "", name: dish.name ?? "") {  result in
            switch result{
            case .success(_):
                ProgressHUD.showSuccess("Your Order has been recieved 🥳🥳")
                
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    
    
    
    
}
