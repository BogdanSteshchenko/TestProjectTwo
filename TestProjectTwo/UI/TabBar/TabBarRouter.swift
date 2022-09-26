//
//  TabBarRouter.swift
//  TestProjectTwo
//
//  Created by Developer on 21.09.2022.
//

import UIKit

protocol ITabBarRouter {
}

final class TabBarRouter: ITabBarRouter {
    
    // Dependencies
    weak var transitionHandler: UIViewController?
}
