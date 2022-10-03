//
//  DeteilArticlesAssembly.swift
//  TestProjectTwo
//
//  Created by Developer on 22.09.2022.
//

import UIKit

protocol IDeteilArticlesAssembly {
    func assemble(article: ArticleModel?, articleFavorite: ArticleFavorite?) -> UIViewController
}

final class DeteilArticlesAssembly: IDeteilArticlesAssembly {
    func assemble(article: ArticleModel?, articleFavorite: ArticleFavorite?) -> UIViewController {
        let viewModelFactory: DeteilArticlesFactory = DeteilArticlesFactory()
        let router: DeteilArticlesRouter = DeteilArticlesRouter()
        let presenter: DeteilArticlesPresenter = DeteilArticlesPresenter(viewModelFactory: viewModelFactory, router: router)
        if article != nil {
            let view = DeteilArticlesViewController(presenter: presenter, article: article, articleFavorite: nil)
            presenter.view = view
            router.transitionHandler = view
            
            return view
        } else {
            let view = DeteilArticlesViewController(presenter: presenter, article: nil, articleFavorite: articleFavorite)
            presenter.view = view
            router.transitionHandler = view
            
            return view
        }
    }    
}
