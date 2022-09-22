//
//  TabBarViewModel.swift
//  TestProjectTwo
//
//  Created by Developer on 21.09.2022.
//

import UIKit

struct TabBarViewModel {
    let type: TabBarItemType
    let tabBarItem: UITabBarItem
}

enum TabBarItemType: Int {
    case articles
    case favorites
}
