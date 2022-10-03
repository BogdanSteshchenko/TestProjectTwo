//
//  WorkCoreDate.swift
//  TestProjectTwo
//
//  Created by Developer on 21.09.2022.
//

import UIKit
import CoreData

final class WorkCoreDate {
    
    static let shared = WorkCoreDate()
    
    let context: NSManagedObjectContext = {
        return CoreData.shared.persistentContainer.viewContext
    }()
    
    // MARK: - Initialization
    private init() {
    }
    
    //MARK: - Method
    func createItem(article: ArticleModel) {
        guard let allArticles = try? context.fetch(ArticleFavorite.fetchRequest()) else { return }
        if !allArticles.contains(where: { $0.id == article.id }) {
            let newArticle = ArticleFavorite(context: context)
            newArticle.title = article.title
            newArticle.publishedDate = article.publishedDate
            newArticle.section = article.section
            newArticle.byline = article.byline
            newArticle.abstract = article.abstract
            newArticle.id = article.id
            newArticle.url = article.url
            newArticle.urlImage = article.urlImage
            do {
                try context.save()
            } catch {
                print("Error")
            }
        }
    }
    
    func getAllOfflineArticles(responce: @escaping ([ArticleFavorite]?, Error?) -> Void) {
        do {
            let article = try context.fetch(ArticleFavorite.fetchRequest())
            responce(article, nil)
        } catch {
            responce(nil, NSError())
        }
    }
    
    func deleteItem(article: ArticleModel) {
        do {
            let articles = try context.fetch(ArticleFavorite.fetchRequest())
            articles.forEach { articles in
                if articles.id == article.id {
                    context.delete(articles as NSManagedObject)
                }
            }
            try context.save()
        } catch {
            print("Error delete article")
        }
    }
    
    // MARK: - Private
    private func fromJpegToData(urlString: String?) -> Data? {
        do {
            guard let urlString = urlString,
                  let url = URL(string: urlString) else { return nil }
            let data = try Data(contentsOf: url)
            let image = UIImage(data: data)
            guard let imageData = image?.jpegData(compressionQuality: 1.0) else { return nil }
            return imageData
        } catch {
            return nil
        }
    }
}
