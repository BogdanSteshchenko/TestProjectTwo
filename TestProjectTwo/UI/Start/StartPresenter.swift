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
    
    // Dependencies
    weak var view: IStartViewController?
    private let viewModelFactory: IStartViewModelFactory
    private let router: IStartRouter
    
    // MARK: - Initialization
    init(
        viewModelFactory: IStartViewModelFactory,
        router: IStartRouter
    ) {
        self.viewModelFactory = viewModelFactory
        self.router = router
    }

    // MARK: - Life cycle
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
