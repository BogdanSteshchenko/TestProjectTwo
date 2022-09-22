//
//  MostPopularViewModel.swift
//  TestProjectTwo
//
//  Created by Developer on 19.09.2022.
//

import UIKit


struct MostPopularViewModel {
    static let empty: MostPopularViewModel = .init(shelves: [])
    
    let shelves: [MostPopularViewModelCell]
}

struct MostPopularViewModelCell {
    let imageArticles: String?
    let nameArticles: String
    let dateArticlesLabel: String
}
