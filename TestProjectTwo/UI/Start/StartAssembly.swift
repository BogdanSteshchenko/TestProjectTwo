//
//  StartAssembly.swift
//  TestProjectTwo
//
//  Created by Developer on 16.09.2022.
//

import UIKit

protocol IStartAssembly {
    func assemble() -> UIViewController
}

final class StartAssembly: IStartAssembly {
    func assemble() -> UIViewController {
        let mostPopularAssembly: MostPopularAssembly = MostPopularAssembly()
        
        let viewModelFactory: StartViewModelFactory = StartViewModelFactory()
        let router: StartRouter = StartRouter(mostPopularAssembly: mostPopularAssembly)
        let presenter: StartPresenter = StartPresenter(viewModelFactory: viewModelFactory, router: router)
        let view = StartViewController(presenter: presenter)
        presenter.view = view
        router.transitionHandler = view
        
        return view
    }
}
