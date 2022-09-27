//
//  DeteilFavoritesPresenter.swift
//  TestProjectTwo
//
//  Created by Developer on 23.09.2022.
//

import Foundation

protocol DeteilFavoriteActions: AnyObject {
    func didTapShareUrl()
}

protocol IDeteilFavoritesPresenter {
    func viewDidLoad(article: ArticleFavorite)
}

final class DeteilFavoritesPresenter: DeteilFavoriteActions, IDeteilFavoritesPresenter {
    
    // Dependencies
    weak var view: DeteilFavoritesViewController?
    private let viewModelFactory: IDeteiFavoritesFactory
    private let router: IDeteilFavoritesRouter
    private var article: ArticleFavorite?
    
    //MARK: - Initialization
    init(
        viewModelFactory: IDeteiFavoritesFactory,
        router: IDeteilFavoritesRouter
    ) {
        self.viewModelFactory = viewModelFactory
        self.router = router
    }
    
    // MARK: - Life cycle
    func viewDidLoad(article: ArticleFavorite) {
        view?.setup(with: viewModelFactory.makeViewModel(actions: self, model: article))
        self.article = article
    }
    
    // MARK: - DeteilFavoriteActions
    func didTapShareUrl() {
        guard let article = article else { return }
        router.shareUrl(article: article)
    }
}
