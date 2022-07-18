//
//  ApiManager.swift
//  PokeAppLC
//
//  Created by Luciano Federico Castro on 18/07/2022.
//

import Foundation
import Alamofire

class ApiManger {
    
    static let shared = ApiManger()
    
    // GET / POST / DELETE / UPDATE
    func getCall(url: String, success: @escaping (Result<Data?, AFError>) -> Void) {
        AF.request(url).response { response in
            success(response.result)
        }
    }

}



