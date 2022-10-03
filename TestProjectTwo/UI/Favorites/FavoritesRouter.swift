//
//  FavoritesRouter.swift
//  TestProjectTwo
//
//  Created by Developer on 19.09.2022.
//

import UIKit

protocol IFavoriteRouter {
    func showDeteilFavorite(article: ArticleModel)
    func deleteArticle(article: ArticleModel)
}

final class FavoritesRouter: IFavoriteRouter {
    
    // Dependencies
    weak var transitionHandler: UIViewController?
    private let deteilFavoritesAssembly: IDeteilArticlesAssembly
    
    //MARK: - Initialization
    init(deteilFavoritesAssembly: IDeteilArticlesAssembly) {
        self.deteilFavoritesAssembly = deteilFavoritesAssembly
    }
    
    //MARK: - IFavoriteRouter
    func showDeteilFavorite(article: ArticleModel) {
        let view: UIViewController = deteilFavoritesAssembly.assemble(article: article, articleFavorite: nil)
        transitionHandler?.navigationController?.pushViewController(view, animated: true)
    }
    func deleteArticle(article: ArticleModel) {
        WorkCoreDate.shared.deleteItem(article: article)
    }
}
