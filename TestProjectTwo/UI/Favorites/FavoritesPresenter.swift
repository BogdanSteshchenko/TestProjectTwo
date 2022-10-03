//
//  FavoritesPresenter.swift
//  TestProjectTwo
//
//  Created by Developer on 19.09.2022.
//

import Foundation

protocol IFavoritesPresenter {
    var viewModel: FavoritesViewModel { get }
    var articles: [ArticleModel] { get }
    func viewDidLoad()
    func didTapDeteilAcrticle(article: ArticleModel)
    func deleteArticle(article: ArticleModel)
}

final class FavoritesPresenter: IFavoritesPresenter {
    
    //Dependecies
    weak var view: FavoritesViewController?
    private let favoritesViewModelFactory: IFavoritesViewModelFactory
    private let router: IFavoriteRouter
    
    //Properties
    private(set) var viewModel: FavoritesViewModel = .empty
    var articles: [ArticleModel] = []
    
    init(
        favoritesViewModelFactory: IFavoritesViewModelFactory, router: IFavoriteRouter) {
            self.favoritesViewModelFactory = favoritesViewModelFactory
            self.router = router
        }
    
    //MARK: - IFavoritesPresenter
    func viewDidLoad() {
        loadData()
    }
    
    private func loadData() {
        WorkCoreDate.shared.getAllOfflineArticles { [weak self] article, error in
            if let error = error {
                print("ERROR = \(error)")
            } else {
                self?.articles = []
                guard let self = self,
                      let article = article else { return }
                article.forEach { articles in
                    let article: ArticleModel = ArticleModel(
                        url: articles.url!,
                        id: articles.id,
                        publishedDate: articles.publishedDate!,
                        section: articles.section!,
                        byline: articles.byline!,
                        title: articles.title!,
                        abstract: articles.abstract!,
                        urlImage: articles.urlImage)
                    self.articles.append(article)
                }
//                self.article = article
                self.view?.setup(with: self.favoritesViewModelFactory.makeViewModel(model: self.articles))
            }
        }
    }
    
    //MARK: - FactoriesActions
    func didTapDeteilAcrticle(article: ArticleModel) {
        router.showDeteilFavorite(article: article)
    }
    func deleteArticle(article: ArticleModel) {
        router.deleteArticle(article: article)
    }
}
