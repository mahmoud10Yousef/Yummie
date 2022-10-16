//
//  Dish.swift
//  Yummie
//
//  Created by mahmoud yousef on 15/10/2022.
//

import Foundation


struct Dish{
    
    let id         : String?
    let name       : String?
    let description: String?
    let image      : String?
    let calories   : Double?
    
    var formattedCalories:String{
        return String(format: "%2f Calories", calories ?? 0)
    }
    
}

