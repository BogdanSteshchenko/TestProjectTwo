//
//  DeteilArticlesFactory.swift
//  TestProjectTwo
//
//  Created by Developer on 22.09.2022.
//

import UIKit

protocol IDeteilArticlesFactory {
    func makeViewModel (actions: DeteilArticlesActions, model: Article) -> DeteilArticlesViewModel
    func makeViewModelFavorite(actions: DeteilArticlesActions, model: ArticleFavorite) -> DeteilArticlesViewModel
}

final class DeteilArticlesFactory: IDeteilArticlesFactory {
    
    //MARK: - IDeteilMostPopularFactory
    func makeViewModel(actions: DeteilArticlesActions, model: Article) -> DeteilArticlesViewModel {
        .init(
            image: model.media?.first?.mediaMetadata[2].url,
            title: model.title,
            section: model.section,
            abstract: model.abstract,
            byline: model.byline,
            publishedDate: getDateString(date: model.publishedDate),
            conditionArticleInFavorite: getConditionFavorite(model: model, modelFavorite: nil),
            addFavorite: makeAddFavoriteButtonModel(actions: actions, model: model, modelFavorite: nil),
            shareUrl: makeShareUrlButton(actions: actions))
    }
    
    func makeViewModelFavorite(actions: DeteilArticlesActions, model: ArticleFavorite) -> DeteilArticlesViewModel {
        .init(
            image: model.urlImage,
            title: model.title,
            section: model.section,
            abstract: model.abstract,
            byline: model.byline,
            publishedDate: getDateString(date: model.publishedDate),
            conditionArticleInFavorite: getConditionFavorite(model: nil, modelFavorite: model),
            addFavorite: makeAddFavoriteButtonModel(actions: actions, model: nil, modelFavorite: model),
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
    private func makeAddFavoriteButtonModel(actions: DeteilArticlesActions, model: Article?, modelFavorite: ArticleFavorite?) -> ButtonViewModelFavorite {
        .init(
            condition: getConditionFavorite(model: model, modelFavorite: modelFavorite),
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
    
    private func getConditionFavorite(model: Article?, modelFavorite: ArticleFavorite?) -> Bool {
        if model != nil {
            var condition = false
            WorkCoreDate.shared.getAllOfflineArticles { articles, error in
                if let error = error {
                    print(error.localizedDescription)
                    condition = false
                } else {
                    guard let articles = articles else { return }
                    if !articles.contains(where: { $0.id == model?.id }) {
                        condition = false
                    } else {
                        condition = true
                    }
                }
            }
            return condition
        } else {
            var condition = false
            WorkCoreDate.shared.getAllOfflineArticles { articles, error in
                if let error = error {
                    print(error.localizedDescription)
                    condition = false
                } else {
                    guard let articles = articles else { return }
                    if !articles.contains(where: { $0.id == modelFavorite?.id }) {
                        condition = false
                    } else {
                        condition = true
                    }
                }
            }
            return condition
        }
    }
}
