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
    func viewDidLoad(article: Article?, articleFavorite: ArticleFavorite?)
}

final class DeteilArticlesPresenter: DeteilArticlesActions, IDeteilArticlesPresenter {
    
    // Dependencies
    weak var view: DeteilArticlesViewController?
    private let viewModelFactory: IDeteilArticlesFactory
    private let router: IDeteilArticlesRouter
    private var article: Article?
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
    func viewDidLoad(article: Article?, articleFavorite: ArticleFavorite?) {
        if article != nil {
            guard let article = article else { return }
            view?.setup(with: viewModelFactory.makeViewModel(actions: self, model: article))
            self.article = article
        } else {
            guard let articleFavorite = articleFavorite else { return }
            view?.setup(with: viewModelFactory.makeViewModelFavorite(actions: self, model: articleFavorite))
            self.articleFavorite = articleFavorite
        }
    }
    // MARK: - DeteilMostPopularActions
    func didTapAddfavorite() {
        guard let article = article else { return }
        router.addNewFavoriteArticle(article: article)
    }
    
    func didTapShareUrl() {
        guard let article = article else { return }
        router.shareUrl(article: article)
    }
}
