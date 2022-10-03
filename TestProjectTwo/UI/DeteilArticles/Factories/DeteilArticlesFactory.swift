//
//  DeteilArticlesFactory.swift
//  TestProjectTwo
//
//  Created by Developer on 22.09.2022.
//

import UIKit

protocol IDeteilArticlesFactory {
    func makeViewModel (actions: DeteilArticlesActions, model: ArticleModel) -> DeteilArticlesViewModel
}

final class DeteilArticlesFactory: IDeteilArticlesFactory {
    
    //MARK: - IDeteilMostPopularFactory
    func makeViewModel(actions: DeteilArticlesActions, model: ArticleModel) -> DeteilArticlesViewModel {
        .init(
            image: model.urlImage,
            title: model.title,
            section: model.section,
            abstract: model.abstract,
            byline: model.byline,
            publishedDate: getDateString(date: model.publishedDate),
            conditionArticleInFavorite: getConditionFavorite(model: model),
            addFavorite: makeAddFavoriteButtonModel(actions: actions, model: model),
            shareUrl: makeShareUrlButton(actions: actions))
    }
    
    
    //MARK: - Private
    private func getDateString(date: Date?) -> String? {
        guard let date = date else { return nil }
        let dataFormatter = DateFormatter()
        dataFormatter.dateFormat = "dd.MM.yyyy"
        let dateString = dataFormatter.string(from: date)
        return dateString
    }
    
    private func makeAddFavoriteButtonModel(actions: DeteilArticlesActions, model: ArticleModel) -> ButtonViewModelFavorite {
        .init(
            condition: getConditionFavorite(model: model),
            action: { [weak actions] in
                actions?.didTapAddfavorite()
            }
        )
    }
    
    private func makeShareUrlButton(actions: DeteilArticlesActions) -> ButtonNavigationBar {
        .init(
            title: "share",
            action: { [weak actions] in
                actions?.didTapShareUrl()
            }
        )
    }
    
    private func getConditionFavorite(model: ArticleModel) -> Bool {
        var condition = false
        WorkCoreDate.shared.getAllOfflineArticles { articles, error in
            if let error = error {
                print(error.localizedDescription)
                condition = false
            } else {
                guard let articles = articles else { return }
                if !articles.contains(where: { $0.id == model.id }) {
                    condition = false
                } else {
                    condition = true
                }
            }
        }
        return condition
    }
}
