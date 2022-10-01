//
//  NetworkDataFetch.swift
//  TestProjectTwo
//
//  Created by Developer on 19.09.2022.
//

import Foundation

enum BaseTypeSection {
    case mostEmailed
    case mostShared
    case mostViewed
}

final class NetworkDataFetch {
    
    static let shared = NetworkDataFetch()
    
    // MARK: - Initialization
    private init() {
    }
    
    func fetchArticles(url: BaseTypeSection, domen: String, version: String, key: String, responce: @escaping (ArticlesModel?, Error?) -> Void) {
        var urlString = ""
        switch url {
        case .mostEmailed:
//            urlString = "https://api.nytimes.com/svc/mostpopular/v2/emailed/30.json?api-key=mrFPbwPT04KhI7ienE7ZRUOlMQSJYI5P"
            urlString = getUrl(domen: domen, version: version, type: "emailed/30.json?api", key: key)
        case .mostShared:
//            urlString = "https://api.nytimes.com/svc/mostpopular/v2/shared/30/facebook.json?api-key=mrFPbwPT04KhI7ienE7ZRUOlMQSJYI5P"
            urlString = getUrl(domen: domen, version: version, type: "shared/30/facebook.json?api", key: key)
        case .mostViewed:
//            urlString = "https://api.nytimes.com/svc/mostpopular/v2/viewed/30.json?api-key=mrFPbwPT04KhI7ienE7ZRUOlMQSJYI5P"
            urlString = getUrl(domen: domen, version: version, type: "viewed/30.json?api", key: key)
        }
        
        NetworkRequest.shared.requestData(urlString: urlString) { result in
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let dateFormatter = DateFormatter()
                    
                    dateFormatter.dateFormat = "yyyy-MM-dd"
                    decoder.dateDecodingStrategy = .formatted(dateFormatter)
                    
                    let articles = try decoder.decode(ArticlesModel.self, from: data)
                    responce(articles, nil )
                } catch let jsonError {
                    print("ERROR JSON = \(jsonError)")
                }
            case .failure(let error):
                responce(nil, error)
            }
        }
    }
    
    //Private
    private func getUrl(domen: String, version: String, type: String, key: String) -> String {
        return "\(domen)/\(version)/\(type)-key=\(key)"
    }
}
