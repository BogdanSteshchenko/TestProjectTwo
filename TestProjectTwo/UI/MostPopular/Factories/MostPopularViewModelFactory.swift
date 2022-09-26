//
//  MostPopularViewModelFactory.swift
//  TestProjectTwo
//
//  Created by Developer on 19.09.2022.
//

import Foundation

protocol IMostPopularViewModelFactory {
    func makeViewModel(model: ArticlesModel) -> MostPopularViewModel
}

final class MostPopularViewModelFactory: IMostPopularViewModelFactory {
    
    //MARK: - IMostPopularViewModelFactory
    func makeViewModel(model: ArticlesModel) -> MostPopularViewModel {
        let shelves: [MostPopularViewModelCell] = self.makeArticles(article: model.results)
        
        return MostPopularViewModel.init(shelves: shelves)
    }
    
    // MARK: - Private
    private func makeArticles(article: [Article]) -> [MostPopularViewModelCell] {
        var mostPopularViewModelCell: [MostPopularViewModelCell] = []
        article.forEach { article in
            let productArticle: MostPopularViewModelCell = .init(
                imageArticles: article.media?.first?.mediaMetadata[0].url,
                nameArticles: article.title,
                dateArticlesLabel: article.publishedDate)
            
            mostPopularViewModelCell.append(productArticle)
        }
        return mostPopularViewModelCell
    }
}
