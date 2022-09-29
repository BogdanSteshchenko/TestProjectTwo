//
//  DeteilMostPopularFactory.swift
//  TestProjectTwo
//
//  Created by Developer on 22.09.2022.
//

import UIKit

protocol IDeteilMostPopularFactory {
    func makeViewModel (actions: DeteilMostPopularActions, model: Article) -> DeteilMostPopularViewModel
}

final class DeteilMostPopularFactory: IDeteilMostPopularFactory {
    
    //MARK: - IDeteilMostPopularFactory
    func makeViewModel(actions: DeteilMostPopularActions, model: Article) -> DeteilMostPopularViewModel {
        .init(
            image: model.media?.first?.mediaMetadata[2].url,
            title: model.title,
            section: model.section,
            abstract: model.abstract,
            byline: model.byline,
            publishedDate: model.publishedDate,
            addFavorite: makeAddFavoriteButtonModel(actions: actions),
            shareUrl: makeShareUrlButton(actions: actions))
        
    }
    
    //MARK: - Private
    private func makeAddFavoriteButtonModel(actions: DeteilMostPopularActions) -> ButtonViewModel {
        .init(
            lokalizationId: "addFavorite",
            action: { [weak actions] in
                actions?.didTapAddfavorite()
            }
        )
    }
    
    private func makeShareUrlButton(actions: DeteilMostPopularActions) -> ButtonNavigationBar {
        .init(
            title: "share",
            action: { [weak actions] in
                actions?.didTapShareUrl()
            }
        )
    }
}
