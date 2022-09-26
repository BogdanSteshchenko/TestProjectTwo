//
//  DeteilFavoritesPresenter.swift
//  TestProjectTwo
//
//  Created by Developer on 23.09.2022.
//

import Foundation

protocol IDeteilFavoritesPresenter {
    func viewDidLoad(article: ArticleFavorite)
}

final class DeteilFavoritesPresenter: IDeteilFavoritesPresenter {
    
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
        view?.setup(with: viewModelFactory.makeViewModel(model: article))
    }
}
