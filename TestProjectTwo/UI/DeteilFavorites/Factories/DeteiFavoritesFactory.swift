//
//  DeteiFavoritesFactory.swift
//  TestProjectTwo
//
//  Created by Developer on 23.09.2022.
//

import UIKit

protocol IDeteiFavoritesFactory {
    func makeViewModel (model: ArticleFavorite) -> DeteilFavoritesViewModel
}

final class DeteiFavoritesFactory: IDeteiFavoritesFactory {
   
    //MARK: - IDeteiFavoritesFactory
    func makeViewModel(model: ArticleFavorite) -> DeteilFavoritesViewModel {
        .init(
            image: getImage(urlData: model.urlFavorite),
            title: model.titleFavorite,
            section: model.sectionFavorite,
            abstract: model.abstractFavorite,
            byline: model.bylineFavorite,
            published_date: model.published_dateFavorite)
    }
    
    //MARK: - Private
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
