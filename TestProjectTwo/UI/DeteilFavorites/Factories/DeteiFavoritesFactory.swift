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
            publishedDate: getDateString(date: model.publishedDate),
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
