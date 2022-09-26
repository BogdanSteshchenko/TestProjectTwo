//
//  FavoritesViewModel.swift
//  TestProjectTwo
//
//  Created by Developer on 19.09.2022.
//

import Foundation


struct FavoritesViewModel {
    static let empty: FavoritesViewModel = .init(shelves: [])

    let shelves: [FavoritesViewModelCell]
}

struct FavoritesViewModelCell {
    let imageArticles: Data?
    let nameArticles: String
    let dateArticlesLabel: String
}
