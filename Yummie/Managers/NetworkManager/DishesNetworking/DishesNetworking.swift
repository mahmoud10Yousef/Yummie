//
//  DishesNetworking.swift
//  Yummie
//
//  Created by mahmoud yousef on 21/10/2022.
//

import Foundation
import Alamofire



enum DishesNetworking{
    case fetchAllCategories
    case placeOrder(dishID:String , name:String )
    case fetchCategoryDishes(String)
    case fetchOrders
}


extension DishesNetworking: TargetType{
    var baseURL: String {
        switch self{
        default:
            return "https://yummie.glitch.me"
        }
    }

    var path: String {
        switch self{
        case .fetchAllCategories:
            return "/dish-categories"
            
        case .placeOrder(let dishID , _):
            return "/orders/\(dishID)"
            
        case .fetchCategoryDishes(let categoryID):
            return "/dishes/\(categoryID)"
            
        case .fetchOrders:
            return "/orders"
        }
    }
    
    var task: Task {
        switch self{
            
        case .fetchAllCategories , .fetchOrders , .fetchCategoryDishes(_):
            return .requestPlain
            
        case .placeOrder(_ , let name):
            return .requestparameters(parameters: ["name": name], encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self{
        default: return [:]
        }
    }
    
    var method: HTTPMethod {
        switch self{
        case .fetchCategoryDishes , .fetchOrders , .fetchAllCategories:
            return .get
            
        case .placeOrder:
            return .post
        }
    }
    
    
}
