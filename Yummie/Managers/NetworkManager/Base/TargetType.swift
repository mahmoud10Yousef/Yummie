//
//  TargetType.swift
//  Yummie
//
//  Created by mahmoud yousef on 20/10/2022.
//

import Foundation
import Alamofire


enum HTTPMethod : String{
    case get    = "GET"
    case post   = "POST"
    case put    = "PUT"
    case delete = "DELETE"
}


enum Task{
    case requestPlain
    case requestparameters(parameters:[String:Any] , encoding:ParameterEncoding)
}


protocol TargetType{
    var baseURL  : String            { get }
    var path     : String            { get }
    var task     : Task              { get }
    var headers  : [String:String]?  { get }
    var method   : HTTPMethod        { get }
}
