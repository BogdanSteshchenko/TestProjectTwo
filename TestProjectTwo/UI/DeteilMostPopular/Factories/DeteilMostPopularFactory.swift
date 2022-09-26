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
            image: getImafe(urlString: model.media?.first?.media_metadata[2].url),
            title: model.title,
            section: model.section,
            abstract: model.abstract,
            byline: model.byline,
            published_date: model.published_date,
            addFavorite: makeAddFavoriteButtonModel(actions: actions))
    }
    
    //MARK: - Private
    private func makeAddFavoriteButtonModel(actions: DeteilMostPopularActions) -> ButtonViewModel {
        .init(
            title: "Add favorite",
            action: { [weak actions] in
                actions?.didTapAddfavorite()
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
