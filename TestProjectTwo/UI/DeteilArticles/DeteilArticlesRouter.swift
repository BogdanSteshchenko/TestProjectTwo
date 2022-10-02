//
//  DeteilArticlesRouter.swift
//  TestProjectTwo
//
//  Created by Developer on 22.09.2022.
//

import UIKit

protocol IDeteilArticlesRouter {
    func addNewFavoriteArticle(article: Article)
    func shareUrl(article: Article)
}

final class DeteilArticlesRouter: IDeteilArticlesRouter {
    
    // Dependencies
    weak var transitionHandler: DeteilArticlesViewController?
    
    //MARK: - IDeteilMostPopularRouter
    func addNewFavoriteArticle(article: Article) {
        WorkCoreDate.shared.createItem(article: article)
    }
    func shareUrl(article: Article) {
        if UIDevice.current.userInterfaceIdiom == .pad {
            let activityViewConroller = UIActivityViewController(activityItems: [article.url], applicationActivities: nil)
            
            activityViewConroller.popoverPresentationController?.sourceView = transitionHandler?.navigationController?.navigationBar

            let frame = CGRect(x: transitionHandler!.navigationController!.navigationBar.frame.maxX - 50, y: 40, width: 0, height: 0)
            activityViewConroller.popoverPresentationController?.sourceRect = frame
            transitionHandler?.present(activityViewConroller, animated: true)
            
        } else {
            let activityViewConroller = UIActivityViewController(activityItems: [article.url], applicationActivities: nil)
            transitionHandler?.present(activityViewConroller, animated: true)
        }
    }
}
