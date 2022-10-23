//
//  DishesAPI.swift
//  Yummie
//
//  Created by mahmoud yousef on 21/10/2022.
//

import Foundation
import SwiftUI

protocol DishesAPIProtocol {
    
    func fetchAllCategories(completion: @escaping(Result<BaseResponse<AllDishes>?, NSError>) -> Void)
    
    func placeOrder(dishId: String, name: String, completion: @escaping(Result<Order?, NSError>) -> Void)
    
    func fetchCategoryDishes(categoryId: String, completion: @escaping(Result<BaseResponse<[Dish]>?, NSError>) -> Void)
    
    func fetchOrders(completion: @escaping(Result<[Order]?, NSError>) -> Void)
    
}

class DishesAPI: BaseAPI<DishesNetworking> , DishesAPIProtocol{
    
    func fetchAllCategories(completion: @escaping (Result<BaseResponse<AllDishes>?, NSError>) -> Void) {
        self.fetchData(target: .fetchAllCategories, responseClass: BaseResponse<AllDishes>.self) { result in
            completion(result)
        }
    }
    
    
    func placeOrder(dishId: String, name: String, completion: @escaping (Result<Order?, NSError>) -> Void) {
        self.fetchData(target: .placeOrder(dishID: dishId, name: name), responseClass: Order.self) { result in
            completion(result)
        }
    }
    
    
    func fetchCategoryDishes(categoryId: String, completion: @escaping (Result<BaseResponse<[Dish]>?, NSError>) -> Void) {
        self.fetchData(target: .fetchCategoryDishes(categoryId), responseClass: BaseResponse<[Dish]>.self) { result in
            completion(result)
        }
    }
    
    
    func fetchOrders(completion: @escaping (Result<[Order]?, NSError>) -> Void) {
        self.fetchData(target: .fetchOrders, responseClass: [Order].self) { result in
            completion(result)
        }
    }
    
    
}
