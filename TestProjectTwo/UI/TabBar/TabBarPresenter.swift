//
//  TabBarPresenter.swift
//  TestProjectTwo
//
//  Created by Developer on 21.09.2022.
//

import Foundation

protocol ITabBarPresenter {
    func viewWillAppear()
}

final class TabBarPresenter: ITabBarPresenter {
    
    // Dependencies
    weak var view: ITabBarController?
    private let router: ITabBarRouter
    private let viewModelFactory: ITabBarViewModelFactory
    
    // MARK: - Initialization
    init(router: TabBarRouter,
         viewModelFactory: ITabBarViewModelFactory) {
        self.router = router
        self.viewModelFactory = viewModelFactory
    }
    
    // MARK: - ITabBarPresenter
    func viewWillAppear() {
        let viewModels: [TabBarViewModel] = viewModelFactory.makeViewModels()
        view?.setup(viewModels: viewModels)
    }
}
