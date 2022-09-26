//
//  FavoritesPresenter.swift
//  TestProjectTwo
//
//  Created by Developer on 19.09.2022.
//

import Foundation

protocol IFavoritesPresenter {
    var viewModel: FavoritesViewModel { get }
    func viewDidLoad()
    func didTapDeteilAcrticle(number: Int)
    func deleteArticle(number: Int)
}

final class FavoritesPresenter: IFavoritesPresenter {
    
    //Dependecies
    weak var view: FavoritesViewController?
    private let favoritesViewModelFactory: IFavoritesViewModelFactory
    private let router: IFavoriteRouter
    
    //Properties
    private(set) var viewModel: FavoritesViewModel = .empty
    private var article: [ArticleFavorite] = []
    
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
    func didTapDeteilAcrticle(number: Int) {
        router.showDeteilFavorite(article: article[number])
    }
    func deleteArticle(number: Int) {
        router.deleteArticle(article: article[number])
    }
}
