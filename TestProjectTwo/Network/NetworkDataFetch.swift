//
//  NetworkDataFetch.swift
//  TestProjectTwo
//
//  Created by Developer on 19.09.2022.
//

import Foundation

enum BaseURLType {
    case mostEmailed
    case mostShared
    case mostViewed
}

final class NetworkDataFetch {
    
    static let shared = NetworkDataFetch()
    
    // MARK: - Initialization
    private init() {
    }
    
    func fetchArticles(url: BaseURLType, responce: @escaping (ArticlesModel?, Error?) -> Void) {
        var urlString = ""
        switch url {
        case .mostEmailed:
            urlString = "https://api.nytimes.com/svc/mostpopular/v2/emailed/30.json?api-key=mrFPbwPT04KhI7ienE7ZRUOlMQSJYI5P"
        case .mostShared:
            urlString = "https://api.nytimes.com/svc/mostpopular/v2/shared/30/facebook.json?api-key=mrFPbwPT04KhI7ienE7ZRUOlMQSJYI5P"
        case .mostViewed:
            urlString = "https://api.nytimes.com/svc/mostpopular/v2/viewed/30.json?api-key=mrFPbwPT04KhI7ienE7ZRUOlMQSJYI5P"
        }
        
        NetworkRequest.shared.requestData(urlString: urlString) { result in
            switch result {
            case .success(let data):
                do {
                    let articles = try JSONDecoder().decode(ArticlesModel.self, from: data)
                    responce(articles, nil )
                } catch let jsonError {
                    print("ERROR JSON = \(jsonError)")
                }
            case .failure(let error):
                responce(nil, error)
            }
        }
    }
}
