//
//  FavoritesRouter.swift
//  TestProjectTwo
//
//  Created by Developer on 19.09.2022.
//

import UIKit

protocol IFavoriteRouter {
    func showDeteilFavorite(article: ArticleFavorite)
    func deleteArticle(article: ArticleFavorite)
}

final class FavoritesRouter: IFavoriteRouter {
    
    // Dependencies
    weak var transitionHandler: UIViewController?
    private let deteilFavoritesAssembly: IDeteilFavoritesAssembly
    
    //MARK: - Initialization
    init(deteilFavoritesAssembly: IDeteilFavoritesAssembly) {
        self.deteilFavoritesAssembly = deteilFavoritesAssembly
    }
    
    //MARK: - IFavoriteRouter
    func showDeteilFavorite(article: ArticleFavorite) {
        let view: UIViewController = deteilFavoritesAssembly.assemble(acticle: article)
        transitionHandler?.navigationController?.pushViewController(view, animated: true)
    }
    func deleteArticle(article: ArticleFavorite) {
        WorkCoreDate.shared.deleteItem(article: article) { _, _ in
            
        }
    }
}
