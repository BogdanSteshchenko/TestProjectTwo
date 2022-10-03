//
//  WorkCoreDate.swift
//  TestProjectTwo
//
//  Created by Developer on 21.09.2022.
//

import UIKit
import CoreData

class WorkCoreDate {
    
    static let shared = WorkCoreDate()
    
    let context: NSManagedObjectContext? = {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            return context
        }
        return nil
    }()
    
    private init() {
    }
    
    func createItem(article: ArticleModel) {
        guard let allArticles = try? context?.fetch(ArticleFavorite.fetchRequest()),
              let context = context else { return }
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
            guard let context = context else { return }
            let article = try context.fetch(ArticleFavorite.fetchRequest())
            responce(article, nil)
        } catch {
            responce(nil, NSError())
        }
    }
    
    func deleteItem(article: ArticleFavorite, responce: @escaping ([ArticleFavorite]?, Error?) -> Void) {
        guard let context = context else { return }
        context.delete(article as NSManagedObject)
        let fetchRequest: NSFetchRequest<ArticleFavorite> = ArticleFavorite.fetchRequest()
        do {
            try context.save()
            let article = try context.fetch(fetchRequest)
            responce(article, nil)
        } catch {
            responce(nil, NSError())
        }
    }
    
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
