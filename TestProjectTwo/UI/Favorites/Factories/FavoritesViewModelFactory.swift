//
//  FavoritesViewModelFactory.swift
//  TestProjectTwo
//
//  Created by Developer on 19.09.2022.
//

import UIKit

protocol IFavoritesViewModelFactory {
    func makeViewModel(model: [ArticleModel]) -> FavoritesViewModel
}


final class FavoritesViewModelFactory: IFavoritesViewModelFactory {
    
    //MARK: - IFavoritesViewModelFactory
    func makeViewModel(model: [ArticleModel]) -> FavoritesViewModel {
        let shelves: [FavoritesViewModelCell] = self.makeArticles(article: model)
        
        return FavoritesViewModel.init(

            shelves: shelves)
    }
    
    // MARK: - Private
    private func makeArticles(article: [ArticleModel]) -> [FavoritesViewModelCell] {
        var favoritesViewModelCell: [FavoritesViewModelCell] = []
        
        article.forEach { article in
            let productArticle: FavoritesViewModelCell = .init(
                imageArticles: article.urlImage,
                nameArticles: article.title,
                dateArticlesLabel: getDateString(date: article.publishedDate) ?? "")
            
            favoritesViewModelCell.append(productArticle)
        }
        return favoritesViewModelCell
    }
    
    private func getDateString(date: Date?) -> String? {
        guard let date = date else { return nil }
        let dataFormatter = DateFormatter()
        dataFormatter.dateFormat = "dd.MM.yyyy"
        let dateString = dataFormatter.string(from: date)
        return dateString
    }
}
