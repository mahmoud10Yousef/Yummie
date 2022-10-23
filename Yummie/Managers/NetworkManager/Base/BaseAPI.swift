//
//  BaseAPI.swift
//  Yummie
//
//  Created by mahmoud yousef on 20/10/2022.
//

import Foundation
import Alamofire

//class BaseAPI<T:TargetType>{
//
//    func fetchData<M:Codable>(target: T , responseClass:M.Type , completeion: @escaping ( Result<M? , NSError>) ->Void){
//        let method     = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
//        let headers    = Alamofire.HTTPHeaders(target.headers ?? [:])
//        let parameters = buildParameters(task: target.task)
//
//        guard let url = URL(string: target.baseURL + target.path ) else {
//            completeion(.failure(NSError()))
//            return
//        }
//
//        AF.request(url, method: method, parameters: parameters.0, encoding: parameters.1, headers: headers).response { respone in
//            guard let statusCode = respone.response?.statusCode , statusCode == 200  else {
//                completeion(.failure(NSError()))
//                return
//            }
//
//            guard let data = respone.data else {
//                completeion(.failure(NSError()))
//                return
//            }
//
//            switch respone.result{
//            case .success(_):
//                do{
//
//                    let jsonObject = try JSONDecoder().decode(M.self, from: data)
//                    completeion(.success(jsonObject))
//                }catch{
//                    completeion(.failure(NSError()))
//                }
//
//            case .failure(_):
//                completeion(.failure(NSError()))
//            }
//
//        }
//
//    }
//
//
//    private func buildParameters(task:Task)-> (parameters: [String:Any] , encoding:ParameterEncoding){
//        switch task {
//        case .requestPlain:
//            return ([:] , URLEncoding.default)
//
//        case .requestparameters(let parameters, let encoding):
//            return (parameters , encoding)
//        }
//    }
//
//}




struct ErrorMessage {
    static let genericError = "Something went wrong please try again later"
}
class BaseAPI<T: TargetType> {
    
    func fetchData<M: Codable>(target: T, responseClass: M.Type, completion:@escaping (Result<M?, NSError>) -> Void) {
        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
        let headers = Alamofire.HTTPHeaders(target.headers ?? [:])
        let params = buildParams(task: target.task)
        AF.request(target.baseURL + target.path, method: method, parameters: params.0, encoding: params.1, headers: headers).responseJSON { (response) in
            guard let statusCode = response.response?.statusCode else {
                // ADD Custom Error
                let error = NSError(domain: target.baseURL, code: 0, userInfo: [NSLocalizedDescriptionKey: ErrorMessage.genericError])
                completion(.failure(error))
                return
            }
            if statusCode == 200 { // 200 reflect success response
                // Successful request
                guard let jsonResponse = try? response.result.get() else {
                    // ADD Custom Error
                    let error = NSError(domain: target.baseURL, code: 0, userInfo: [NSLocalizedDescriptionKey: ErrorMessage.genericError])
                    completion(.failure(error))
                    return
                }
                guard let theJSONData = try? JSONSerialization.data(withJSONObject: jsonResponse, options: .fragmentsAllowed) else {
                    // ADD Custom Error
                    let error = NSError(domain: target.baseURL, code: 0, userInfo: [NSLocalizedDescriptionKey: ErrorMessage.genericError])
                    completion(.failure(error))
                    return
                }
                guard let responseObj = try? JSONDecoder().decode(M.self, from: theJSONData) else {
                    // ADD Custom Error
                    let error = NSError(domain: target.baseURL, code: 0, userInfo: [NSLocalizedDescriptionKey: ErrorMessage.genericError])
                    completion(.failure(error))
                    return
                }
                completion(.success(responseObj))
            } else {
                // ADD custom error base on status code 404 / 401 /
                // Error Parsing for the error message from the BE
                let message = "Error Message Parsed From BE"
                let error = NSError(domain: target.baseURL, code: statusCode, userInfo: [NSLocalizedDescriptionKey: message])
                completion(.failure(error))
            }
        }
    }
    
    
    private func buildParams(task: Task) -> ([String:Any], ParameterEncoding) {
        switch task {
        case .requestPlain:
            return ([:], URLEncoding.default)
        case .requestparameters(parameters: let parameters, encoding: let encoding):
            return (parameters, encoding)
        }
    }
}
