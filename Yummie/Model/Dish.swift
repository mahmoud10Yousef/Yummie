//
//  Dish.swift
//  Yummie
//
//  Created by mahmoud yousef on 15/10/2022.
//

import Foundation


struct Dish:Codable{
    
    let id          : String?
    let name        : String?
    let description : String?
    let image       : String?
    let calories    : Int?
    
    var formattedCalories: String {
           return "\(calories ?? 0) calories"
       }
    
    
}

