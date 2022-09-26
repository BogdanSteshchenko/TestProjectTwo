//
//  NetworkRequest.swift
//  TestProjectTwo
//
//  Created by Developer on 19.09.2022.
//

import Foundation
import Alamofire

class NetworkRequest {
    
    static let shared = NetworkRequest()
    
    // MARK: - Initialization
    private init() {
    }
    
    func requestData(urlString: String, comlition: @escaping (Result<Data, Error>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        AF.request(url).responseData { response in
            DispatchQueue.main.async {
                guard let data = response.data else {
                    let error = NSError()
                    comlition(.failure(error))
                    return
                }
                comlition(.success(data))
            }
        }
    }
}

