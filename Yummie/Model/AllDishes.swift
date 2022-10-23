//
//  AllDishes.swift
//  Yummie
//
//  Created by mahmoud yousef on 21/10/2022.
//

import Foundation


struct AllDishes: Codable {
    
    let categories : [DishCategory]?
    let populars   : [Dish]?
    let specials   : [Dish]?
}
