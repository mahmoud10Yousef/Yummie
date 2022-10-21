//
//  BaseAPI.swift
//  Yummie
//
//  Created by mahmoud yousef on 20/10/2022.
//

import Foundation
import Alamofire

class BaseAPI<T:TargetType>{
    
    func fetchData<M:Codable>(target: T , responseClass:M.Type , completeion: @escaping ( Result<M? , NSError>) ->Void){
        let method     = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
        let headers    = Alamofire.HTTPHeaders(target.headers ?? [:])
        let parameters = buildParameters(task: target.task)
        
        guard let url = URL(string: target.baseURL + target.path ) else {
            completeion(.failure(NSError()))
            return
        }
        
        AF.request(url, method: method, parameters: parameters.0, encoding: parameters.1, headers: headers).response { respone in
            guard let statusCode = respone.response?.statusCode , statusCode == 200  else {
                completeion(.failure(NSError()))
                return
            }
            
            guard let data = respone.data else {
                completeion(.failure(NSError()))
                return
            }
            
            switch respone.result{
                
            case .success(_):
                do{
                    let jsonObject = try JSONDecoder().decode(M.self, from: data)
                    completeion(.success(jsonObject))
                }catch{
                    completeion(.failure(NSError()))
                }
                
            case .failure(_):
                completeion(.failure(NSError()))
            }
            
        }
        
        
    }
    
    
    private func buildParameters(task:Task)-> (parameters: [String:Any] , encoding:ParameterEncoding){
        switch task {
        case .requestPlain:
            return ([:] , URLEncoding.default)
        case .requestparameters(let parameters, let encoding):
            return (parameters , encoding)
        }
    }
    
}
