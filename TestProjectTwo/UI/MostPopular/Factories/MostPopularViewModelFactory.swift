//
//  MostPopularViewModelFactory.swift
//  TestProjectTwo
//
//  Created by Developer on 19.09.2022.
//

import Foundation

protocol IMostPopularViewModelFactory {
    func makeViewModel(model: ArticlesModel, type: BaseTypeSection) -> MostPopularViewModel
}

final class MostPopularViewModelFactory: IMostPopularViewModelFactory {
    
    //MARK: - IMostPopularViewModelFactory
    func makeViewModel(model: ArticlesModel, type: BaseTypeSection) -> MostPopularViewModel {
        let shelves: [MostPopularViewModelCell] = self.makeArticles(article: model.results)
        let title = getTitle(type: type)
        
        return MostPopularViewModel.init(title: title, shelves: shelves)
    }
    
    // MARK: - Private
    private func makeArticles(article: [Article]) -> [MostPopularViewModelCell] {
        var mostPopularViewModelCell: [MostPopularViewModelCell] = []
        article.forEach { article in
            let productArticle: MostPopularViewModelCell = .init(
                imageArticles: article.media?.first?.mediaMetadata[0].url,
                nameArticles: article.title,
                dateArticlesLabel: getDateString(date: article.publishedDate))
            
            mostPopularViewModelCell.append(productArticle)
        }
        return mostPopularViewModelCell
    }
    
    private func getDateString(date: Date) -> String {
        let dataFormatter = DateFormatter()
        dataFormatter.dateFormat = "dd.MM.yyyy"
        let dateString = dataFormatter.string(from: date)
        return dateString
    }
    
    private func getTitle(type: BaseTypeSection) -> String {
        switch type {
        case .mostEmailed:
            return NSLocalizedString("mostEmailed", comment: "")
        case.mostShared:
            return NSLocalizedString("mostShared", comment: "")
        case .mostViewed:
            return NSLocalizedString("mostViewed", comment: "")
        }
    }
}
