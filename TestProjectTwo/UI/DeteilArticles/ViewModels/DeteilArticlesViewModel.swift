//
//  DeteilArticlesViewModel.swift
//  TestProjectTwo
//
//  Created by Developer on 22.09.2022.
//

import Foundation

struct DeteilArticlesViewModel {
    let image: String?
    let title: String?
    let section: String?
    let abstract: String?
    let byline: String?
    let publishedDate: String?
    let conditionArticleInFavorite: Bool
    
    let addFavorite: ButtonViewModelFavorite
    let shareUrl: ButtonNavigationBar
}
