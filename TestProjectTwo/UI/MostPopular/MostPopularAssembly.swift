//
//  MostPopularAssembly.swift
//  TestProjectTwo
//
//  Created by Developer on 19.09.2022.
//

import UIKit

protocol IMostPopularAssembly {
    func assemble(type: BaseTypeSection) -> UIViewController
}

final class MostPopularAssembly: IMostPopularAssembly {
    func assemble(type: BaseTypeSection) -> UIViewController {
        let deteilMostPopularAssembly: DeteilMostPopularAssembly = DeteilMostPopularAssembly()
        
        let viewModelFactory: MostPopularViewModelFactory = MostPopularViewModelFactory()
        let router: MostPopularRouter = MostPopularRouter(deteilMostPopularAssembly: deteilMostPopularAssembly)
        let presenter: MostPopularPresenter = MostPopularPresenter(mostPopularViewModelFactory: viewModelFactory, router: router)
        let view: MostPopularViewController = MostPopularViewController(presenter: presenter, sectionType: type)
        presenter.view = view
        router.transitionHandler = view
        
        return view
    }
}
