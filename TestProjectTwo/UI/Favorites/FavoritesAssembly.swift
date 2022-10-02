//
//  FavoritesAssembly.swift
//  TestProjectTwo
//
//  Created by Developer on 19.09.2022.
//

import UIKit

protocol IFavoritesAssembly {
    func assemble() -> UIViewController
}

final class FavoritesAssembly: IFavoritesAssembly {
    func assemble() -> UIViewController {
        let deteilFavoritesAssembly: DeteilArticlesAssembly = DeteilArticlesAssembly()
        let viewModelFactory: FavoritesViewModelFactory = FavoritesViewModelFactory()
        let router: FavoritesRouter = FavoritesRouter(deteilFavoritesAssembly: deteilFavoritesAssembly)
        let preseter: FavoritesPresenter = FavoritesPresenter(favoritesViewModelFactory: viewModelFactory, router: router)
        let view: FavoritesViewController = FavoritesViewController(presenter: preseter)
        preseter.view = view
        router.transitionHandler = view
        
        return view
    }
}
