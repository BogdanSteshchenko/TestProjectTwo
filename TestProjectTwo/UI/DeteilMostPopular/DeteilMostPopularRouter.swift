//
//  DeteilMostPopularRouter.swift
//  TestProjectTwo
//
//  Created by Developer on 22.09.2022.
//

import UIKit

protocol IDeteilMostPopularRouter {
    func addNewFavoriteArticle(article: Article)
    func shareUrl(article: Article)
}

final class DeteilMostPopularRouter: IDeteilMostPopularRouter {
    
    // Dependencies
    weak var transitionHandler: DeteilMostPopularViewController?
    
    //MARK: - IDeteilMostPopularRouter
    func addNewFavoriteArticle(article: Article) {
        WorkCoreDate.shared.createItem(article: article)
    }
    func shareUrl(article: Article) {
        let activityViewConroller = UIActivityViewController(activityItems: [article.url], applicationActivities: nil)
        transitionHandler?.present(activityViewConroller, animated: true)
    }
}
