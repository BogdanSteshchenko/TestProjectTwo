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
}

final class FavoritesPresenter: IFavoritesPresenter {
    
    //Dependecies
    weak var view: FavoritesViewController?
    private let favoritesViewModelFactory: IFavoritesViewModelFactory
    private let router: IFavoriteRouter
    
    //Properties
    private(set) var viewModel: FavoritesViewModel = .empty
    
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
                self.view?.setup(with: self.favoritesViewModelFactory.makeViewModel(model: article))
            }
        }
    }
}
