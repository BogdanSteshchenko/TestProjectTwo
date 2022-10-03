//
//  MostPopularPresenter.swift
//  TestProjectTwo
//
//  Created by Developer on 19.09.2022.
//

import Foundation

protocol IMostPopularPresenter {
    var viewModel: MostPopularViewModel { get }
    var article: [ArticleModel] { get }
    func viewDidLoad(type: BaseTypeSection)
    func didTapDeteilAcrticle(article: ArticleModel)
}

final class MostPopularPresenter: IMostPopularPresenter {
    
    // Dependencies
    weak var view: MostPopularViewController?
    private let mostPopularViewModelFactory: IMostPopularViewModelFactory
    private let router: IMostPopularRouter
    
    // Properties
    private(set) var viewModel: MostPopularViewModel = .empty
    var article: [ArticleModel] = []
    
    // MARK: - Initialization
    init(
        mostPopularViewModelFactory: IMostPopularViewModelFactory,
        router: IMostPopularRouter) {
            self.mostPopularViewModelFactory = mostPopularViewModelFactory
            self.router = router
        }
    
    //MARK: - IMostPopularPresenter
    
    func viewDidLoad(type: BaseTypeSection) {
        loadData(type: type)
    }
    
    //MARK: - Private
    private func loadData(type: BaseTypeSection) {
        var urlString: BaseTypeSection!
        switch type {
        case .mostEmailed:
            urlString = .mostEmailed
        case .mostShared:
            urlString = .mostShared
        case .mostViewed:
            urlString = .mostViewed
        }
        NetworkDataFetch.shared.fetchArticles(url: urlString, domen: "https://api.nytimes.com/svc/mostpopular", version: "v2", key: "mrFPbwPT04KhI7ienE7ZRUOlMQSJYI5P") { [weak self] responce, error in
            if error != nil {
                guard let self = self else { return }
                self.router.errorNetwork(view: self.view)
            } else {
                guard let self = self,
                      let responce = responce else { return }
                responce.results.forEach { articles in
                    let article: ArticleModel = ArticleModel(
                        url: articles.url,
                        id: articles.id,
                        publishedDate: articles.publishedDate,
                        section: articles.section,
                        byline: articles.byline,
                        title: articles.title,
                        abstract: articles.abstract,
                        urlImage: articles.media?.first?.mediaMetadata[2].url
                    )
                    self.article.append(article)
                }
                self.view?.setup(with: self.mostPopularViewModelFactory.makeViewModel(model: responce, type: type))
            }
        }
    }
    
    //MARK: - MostPopularActions
    func didTapDeteilAcrticle(article: ArticleModel) {
        router.showDeteilFavorite(article: article)
    }
}
