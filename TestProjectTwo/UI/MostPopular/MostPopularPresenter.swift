//
//  MostPopularPresenter.swift
//  TestProjectTwo
//
//  Created by Developer on 19.09.2022.
//

import Foundation

protocol IMostPopularPresenter {
    var viewModel: MostPopularViewModel { get }
    func viewDidLoad(url: String)
    func didTapDeteilAcrticle(number: Int)
}

final class MostPopularPresenter: IMostPopularPresenter {
    
    // Dependencies
    weak var view: MostPopularViewController?
    private let mostPopularViewModelFactory: IMostPopularViewModelFactory
    private let router: IMostPopularRouter
    
    // Properties
    private(set) var viewModel: MostPopularViewModel = .empty
    private var article: [Article] = []
    
    // MARK: - Initialization
    init(
        mostPopularViewModelFactory: IMostPopularViewModelFactory,
        router: IMostPopularRouter) {
            self.mostPopularViewModelFactory = mostPopularViewModelFactory
            self.router = router
        }
    
    //MARK: - IMostPopularPresenter
    
    func viewDidLoad(url: String) {
        loadData(url: url)
    }
    
    //MARK: - Private
    private func loadData(url: String) {
        var urlString: BaseURLType!
        switch url {
        case NSLocalizedString("mostEmailed", comment: ""):
            urlString = .mostEmailed
        case NSLocalizedString("mostShared", comment: ""):
            urlString = .mostShared
        case NSLocalizedString("mostViewed", comment: ""):
            urlString = .mostViewed
        default:
            return
        }
        NetworkDataFetch.shared.fetchArticles(url: urlString) { [weak self] responce, error in
            if let error = error {
                print("Error 1 = \(error)")
            } else {
                guard let self = self,
                      let responce = responce else { return }
                self.article = responce.results
                self.view?.setup(with: self.mostPopularViewModelFactory.makeViewModel(model: responce))
            }
        }
    }
    
    //MARK: - MostPopularActions
    func didTapDeteilAcrticle(number: Int) {
        router.showDeteilFavorite(article: article[number])
    }
}
