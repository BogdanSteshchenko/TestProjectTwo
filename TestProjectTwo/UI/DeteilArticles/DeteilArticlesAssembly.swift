//
//  DeteilArticlesAssembly.swift
//  TestProjectTwo
//
//  Created by Developer on 22.09.2022.
//

import UIKit

protocol IDeteilArticlesAssembly {
    func assemble(article: ArticleModel) -> UIViewController
}

final class DeteilArticlesAssembly: IDeteilArticlesAssembly {
    func assemble(article: ArticleModel) -> UIViewController {
        let viewModelFactory: DeteilArticlesFactory = DeteilArticlesFactory()
        let router: DeteilArticlesRouter = DeteilArticlesRouter()
        let presenter: DeteilArticlesPresenter = DeteilArticlesPresenter(viewModelFactory: viewModelFactory, router: router)
        
        let view = DeteilArticlesViewController(presenter: presenter, article: article, articleFavorite: nil)
        presenter.view = view
        router.transitionHandler = view
        
        return view
    }
}
