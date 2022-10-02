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
            addFavorite: makeAddFavoriteButtonModel(actions: actions),
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
            addFavorite: makeAddFavoriteButtonModel(actions: actions),
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
    private func makeAddFavoriteButtonModel(actions: DeteilArticlesActions) -> ButtonViewModel {
        .init(
            lokalizationId: "addFavorite",
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
}
