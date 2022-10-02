//
//  FavoritesPresenter.swift
//  TestProjectTwo
//
//  Created by Developer on 19.09.2022.
//

import Foundation

protocol IFavoritesPresenter {
    var viewModel: FavoritesViewModel { get }
    var article: [ArticleFavorite] { get }
    func viewDidLoad()
    func didTapDeteilAcrticle(article: ArticleFavorite)
    func deleteArticle(article: ArticleFavorite)
}

final class FavoritesPresenter: IFavoritesPresenter {
    
    //Dependecies
    weak var view: FavoritesViewController?
    private let favoritesViewModelFactory: IFavoritesViewModelFactory
    private let router: IFavoriteRouter
    
    //Properties
    private(set) var viewModel: FavoritesViewModel = .empty
    var article: [ArticleFavorite] = []
    
    init(
        favoritesViewModelFactory: IFavoritesViewModelFactory, router: IFavoriteRouter) {
            self.favoritesViewModelFactory = favoritesViewModelFactory
            self.router = router
        }
    
    //MARK: - IFavoritesPresenter
    func viewDidLoad() {
        loadData()
    }
    
    private func loadData() {
        WorkCoreDate.shared.getAllOfflineArticles { [weak self] article, error in
            if let error = error {
                print("ERROR = \(error)")
            } else {
                guard let self = self,
                      let article = article else { return }
                self.article = article
                self.view?.setup(with: self.favoritesViewModelFactory.makeViewModel(model: article))
            }
        }
    }
    
    //MARK: - FactoriesActions
    func didTapDeteilAcrticle(article: ArticleFavorite) {
        router.showDeteilFavorite(article: article)
    }
    func deleteArticle(article: ArticleFavorite) {
        router.deleteArticle(article: article)
    }
}
