//
//  DeteilArticlesRouter.swift
//  TestProjectTwo
//
//  Created by Developer on 22.09.2022.
//

import UIKit

protocol IDeteilArticlesRouter {
    func addNewFavoriteArticle(article: ArticleModel?, articleFavorite: ArticleFavorite?)
    func shareUrl(article: ArticleModel?, articleFavorite: ArticleFavorite?)
}

final class DeteilArticlesRouter: IDeteilArticlesRouter {
    
    // Dependencies
    weak var transitionHandler: DeteilArticlesViewController?
    
    //MARK: - IDeteilMostPopularRouter
    func addNewFavoriteArticle(article: ArticleModel?, articleFavorite: ArticleFavorite?) {
        WorkCoreDate.shared.getAllOfflineArticles { articles, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                guard let articles = articles,
                let article = article else { return }
                
                if !articles.contains(where: { $0.id == article.id }) {
                    WorkCoreDate.shared.createItem(article: article)
                    self.transitionHandler?.viewDidLoad()
                } else {
                
                }
            }
        }
    }
    func shareUrl(article: ArticleModel?, articleFavorite: ArticleFavorite?) {
        if article != nil {
            guard let article = article else { return }
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
        } else {
            guard let articleFavorite = articleFavorite else { return }
            if UIDevice.current.userInterfaceIdiom == .pad {
                let activityViewConroller = UIActivityViewController(activityItems: [articleFavorite.url], applicationActivities: nil)
                
                activityViewConroller.popoverPresentationController?.sourceView = transitionHandler?.navigationController?.navigationBar

                let frame = CGRect(x: transitionHandler!.navigationController!.navigationBar.frame.maxX - 50, y: 40, width: 0, height: 0)
                activityViewConroller.popoverPresentationController?.sourceRect = frame
                transitionHandler?.present(activityViewConroller, animated: true)
                
            } else {
                let activityViewConroller = UIActivityViewController(activityItems: [articleFavorite.url], applicationActivities: nil)
                transitionHandler?.present(activityViewConroller, animated: true)
            }
        }
    }
}
