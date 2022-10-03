//
//  DeteilArticlesPresenter.swift
//  TestProjectTwo
//
//  Created by Developer on 22.09.2022.
//

import Foundation

protocol DeteilArticlesActions: AnyObject {
    func didTapAddfavorite()
    func didTapShareUrl()
}

protocol IDeteilArticlesPresenter {
    func viewDidLoad(article: ArticleModel?)
}

final class DeteilArticlesPresenter: DeteilArticlesActions, IDeteilArticlesPresenter {
    
    // Dependencies
    weak var view: DeteilArticlesViewController?
    private let viewModelFactory: IDeteilArticlesFactory
    private let router: IDeteilArticlesRouter
    private var article: ArticleModel?
    private var articleFavorite: ArticleFavorite?
    
    
    // MARK: - Initialization
    init(
        viewModelFactory: IDeteilArticlesFactory,
        router: IDeteilArticlesRouter
    ) {
        self.viewModelFactory = viewModelFactory
        self.router = router
    }
    
    // MARK: - Life cycle
    func viewDidLoad(article: ArticleModel?) {
        guard let article = article else { return }
        view?.setup(with: viewModelFactory.makeViewModel(actions: self, model: article))
        self.article = article
    }
    
    // MARK: - DeteilMostPopularActions
    func didTapAddfavorite() {
        router.addNewFavoriteArticle(article: article, articleFavorite: articleFavorite)
    }
    
    func didTapShareUrl() {
        router.shareUrl(article: article, articleFavorite: articleFavorite)
    }
}
