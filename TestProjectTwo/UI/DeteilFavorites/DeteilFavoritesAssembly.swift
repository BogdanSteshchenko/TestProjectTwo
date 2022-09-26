//
//  DeteilFavoritesAssembly.swift
//  TestProjectTwo
//
//  Created by Developer on 23.09.2022.
//

import UIKit

protocol IDeteilFavoritesAssembly {
    func assemble(acticle: ArticleFavorite) -> UIViewController
}

final class DeteilFavoritesAssembly: IDeteilFavoritesAssembly {
    func assemble(acticle: ArticleFavorite) -> UIViewController {
        let viewModelFactory: DeteiFavoritesFactory = DeteiFavoritesFactory()
        let router: DeteilFavoritesRoute = DeteilFavoritesRoute()
        let presenter: DeteilFavoritesPresenter = DeteilFavoritesPresenter(viewModelFactory: viewModelFactory, router: router)
        let view = DeteilFavoritesViewController(presenter: presenter, article: acticle)
        presenter.view = view
        
        return view
    }
}
