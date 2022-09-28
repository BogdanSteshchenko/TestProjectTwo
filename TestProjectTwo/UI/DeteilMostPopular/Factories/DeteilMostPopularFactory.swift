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
            image: getImafe(urlString: model.media?.first?.mediaMetadata[2].url),
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
    
    private func getImafe(urlString: String?) -> UIImage? {
        if let image = loadImage(urlString: urlString) {
            return image
        } else {
            let image = UIImage(named: "default")
            return image
        }
    }
    
    private func loadImage(urlString: String?) -> UIImage? {
        do {
            guard let urlString = urlString else { return nil }
            guard let url = URL(string: urlString) else { return nil }
            let data = try Data(contentsOf: url)
            let image = UIImage(data: data)

            return image
        } catch {
            return nil
        }
    }
}
