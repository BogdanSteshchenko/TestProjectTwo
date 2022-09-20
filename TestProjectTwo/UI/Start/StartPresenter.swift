//
//  StartPresenter.swift
//  TestProjectTwo
//
//  Created by Developer on 16.09.2022.
//

import Foundation

protocol StartActions: AnyObject {
    func didTapMostEmailed()
    func didTapMostShared()
    func didTapMostViewed()
}

protocol IStartPresenter {
    func viewDidLoad()
}

final class StartPresenter: StartActions, IStartPresenter {
    
    weak var view: IStartViewController?
    private let viewModelFactory: IStartViewModelFactory
    private let router: IStartRouter
//    private weak var logInModuleDelegate: LogInModuleDelegate?
    
    
    init(
        viewModelFactory: IStartViewModelFactory,
        router: IStartRouter
//        logInModuleDelegate: LogInModuleDelegate?
    ) {
        self.viewModelFactory = viewModelFactory
        self.router = router
//        self.logInModuleDelegate = logInModuleDelegate
    }

    
    func viewDidLoad() {
        view?.setup(with: viewModelFactory.makeViewModel(actions: self))
    }

    
    
    // MARK: - StartActions
    
    func didTapMostEmailed() {
        router.showDetailMostEmailed()
    }
    
    func didTapMostShared() {
        router.showDetailMostShared()
    }
    
    func didTapMostViewed() {
        router.showDetailMostViewed()
    }
}
