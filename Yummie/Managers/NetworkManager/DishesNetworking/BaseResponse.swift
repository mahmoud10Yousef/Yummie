//
//  BaseResponse.swift
//  Yummie
//
//  Created by mahmoud yousef on 21/10/2022.
//

import Foundation

struct BaseResponse<T: Codable>: Codable {
    let status: Int
    let message: String?
    let data: T?
    let error: String?
}
