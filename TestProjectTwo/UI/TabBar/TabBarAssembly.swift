//
//  TabBarAssembly.swift
//  TestProjectTwo
//
//  Created by Developer on 21.09.2022.
//

import UIKit

protocol ITabBarAssembly {
    func assemble() -> UIViewController
}

final class TabBarAssembly: ITabBarAssembly {
    func assemble() -> UIViewController {
        let router: TabBarRouter = TabBarRouter()
        let viewModelFactory: TabBarViewModelFactory = TabBarViewModelFactory()
        let presenter: TabBarPresenter = TabBarPresenter(
            router: router,
            viewModelFactory: viewModelFactory
        )
        let tabBarViewControllersResolver: TabBarViewControllersResolver = TabBarViewControllersResolver()
        let view: TabBarController = TabBarController(
            presenter: presenter,
            tabBarViewControllersResolver: tabBarViewControllersResolver
        )
        presenter.view = view
        router.transitionHandler = view

        return view
    }
}
