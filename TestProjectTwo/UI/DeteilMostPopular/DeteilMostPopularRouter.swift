//
//  DeteilMostPopularRouter.swift
//  TestProjectTwo
//
//  Created by Developer on 22.09.2022.
//

import Foundation

protocol IDeteilMostPopularRouter {
    func addNewFavoriteArticle(article: Article)
}

final class DeteilMostPopularRouter: IDeteilMostPopularRouter {
    
    //MARK: - IDeteilMostPopularRouter
    func addNewFavoriteArticle(article: Article) {
        WorkCoreDate.shared.createItem(article: article)
    }
    
    
}
