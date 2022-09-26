//
//  TabBarViewModelFactory.swift
//  TestProjectTwo
//
//  Created by Developer on 21.09.2022.
//

import UIKit

protocol ITabBarViewModelFactory {
    func makeViewModels() -> [TabBarViewModel]
}

final class TabBarViewModelFactory: ITabBarViewModelFactory {
    
    // MARK: - ITabBarViewModelFactory
    func makeViewModels() -> [TabBarViewModel] {
        [
            .init(type: .articles, tabBarItem: .init(
                title: "Articles",
                image: UIImage(systemName: "book.fill"),
                tag: 0)),
            .init(type: .favorites, tabBarItem: .init(
                title: "Favorites",
                image: UIImage(systemName: "star.fill"),
                tag: 1))
        ]
    }
}
