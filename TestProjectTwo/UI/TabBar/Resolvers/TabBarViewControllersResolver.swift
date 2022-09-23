//
//  TabBarViewControllersResolver.swift
//  TestProjectTwo
//
//  Created by Developer on 21.09.2022.
//

import UIKit

protocol ITabBarViewControllersResolver {
    func resolveViewController(type: TabBarItemType) -> UIViewController
}

final class TabBarViewControllersResolver: ITabBarViewControllersResolver {
    
    // MARK: - ITabBarViewControllersResolver
    func resolveViewController(type: TabBarItemType) -> UIViewController {
        switch type {
        case .favorites:
            return FavoritesAssembly().assemble()
        case .articles:
            return StartAssembly().assemble()
        }
    }
}
