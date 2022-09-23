//
//  DeteilMostPopularPresenter.swift
//  TestProjectTwo
//
//  Created by Developer on 22.09.2022.
//

import Foundation

protocol DeteilMostPopularActions: AnyObject {
    func didTapAddfavorite()
}

protocol IDeteilMostPopularPresenter {
    func viewDidLoad(article: Article)
}

final class DeteilMostPopularPresenter: DeteilMostPopularActions, IDeteilMostPopularPresenter {
    
    // Dependencies
    weak var view: DeteilMostPopularViewController?
    private let viewModelFactory: IDeteilMostPopularFactory
    private let router: IDeteilMostPopularRouter
    
    
    // MARK: - Initialization
    init(
        viewModelFactory: IDeteilMostPopularFactory,
        router: IDeteilMostPopularRouter
    ) {
        self.viewModelFactory = viewModelFactory
        self.router = router
    }
    
    // MARK: - Life cycle
    
    func viewDidLoad(article: Article) {
        view?.setup(with: viewModelFactory.makeViewModel(actions: self, model: article))
    }
    // MARK: - DeteilMostPopularActions
    
    func didTapAddfavorite() {
        print("Add to favorite")
    }
}
