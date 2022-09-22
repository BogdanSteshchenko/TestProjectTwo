//
//  FavoritesViewModelFactory.swift
//  TestProjectTwo
//
//  Created by Developer on 19.09.2022.
//

import UIKit

protocol IFavoritesViewModelFactory {
    func makeViewModel(model: [ArticleFavorite]) -> FavoritesViewModel
}


final class FavoritesViewModelFactory: IFavoritesViewModelFactory {
    
    //MARK: - IFavoritesViewModelFactory
    
    func makeViewModel(model: [ArticleFavorite]) -> FavoritesViewModel {
        let shelves: [FavoritesViewModelCell] = self.makeArticles(article: model)
        
        return FavoritesViewModel.init(

            shelves: shelves)
    }
    
    // MARK: - Private
    
    private func makeArticles(article: [ArticleFavorite]) -> [FavoritesViewModelCell] {
        var favoritesViewModelCell: [FavoritesViewModelCell] = []
        
        article.forEach { article in
            let productArticle: FavoritesViewModelCell = .init(
                imageArticles: article.mediaFavorite,
                nameArticles: article.titleFavorite ?? "",
                dateArticlesLabel: article.published_dateFavorite ?? "")
            
            favoritesViewModelCell.append(productArticle)
        }
        return favoritesViewModelCell
    }
}
