//
//  DeteiFavoritesFactory.swift
//  TestProjectTwo
//
//  Created by Developer on 23.09.2022.
//

import UIKit

protocol IDeteiFavoritesFactory {
    func makeViewModel (actions: DeteilFavoriteActions, model: ArticleFavorite) -> DeteilFavoritesViewModel
}

final class DeteiFavoritesFactory: IDeteiFavoritesFactory {
   
    //MARK: - IDeteiFavoritesFactory
    func makeViewModel(actions: DeteilFavoriteActions, model: ArticleFavorite) -> DeteilFavoritesViewModel {
        .init(
            image: model.urlImage,
            title: model.title,
            section: model.section,
            abstract: model.abstract,
            byline: model.byline,
            publishedDate: model.publishedDate,
            shareUrl: makeShareUrlButton(actions: actions))
    }
    
    //MARK: - Private
    private func makeShareUrlButton(actions: DeteilFavoriteActions) -> ButtonNavigationBar {
        .init(
            title: "share",
            action: { [weak actions] in
                actions?.didTapShareUrl()
            }
        )
    }
    
    private func getImage(urlData: Data?) -> UIImage? {
        if let image = loadImage(urlData: urlData) {
            return image
        } else {
            let image = UIImage(named: "default")
            return image
        }
    }
    
    private func loadImage(urlData: Data?) -> UIImage? {
        guard let data = urlData else { return nil }
        guard let image = UIImage(data: data) else { return nil }
        return image
    }
}
