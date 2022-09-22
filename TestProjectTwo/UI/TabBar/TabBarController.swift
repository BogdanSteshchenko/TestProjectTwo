//
//  TabBarController.swift
//  TestProjectTwo
//
//  Created by Developer on 21.09.2022.
//

import UIKit

protocol ITabBarController: AnyObject {
    func setup(viewModels: [TabBarViewModel])
}

final class TabBarController: UITabBarController, UITabBarControllerDelegate, ITabBarController {
    
    // Dependencies
    
    private let presenter: ITabBarPresenter
    private let tabBarViewControllersResolver: ITabBarViewControllersResolver
    
    // MARK: - Initialization
    
    init(presenter: ITabBarPresenter, tabBarViewControllersResolver: ITabBarViewControllersResolver) {
        self.presenter = presenter
        self.tabBarViewControllersResolver = tabBarViewControllersResolver
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter.viewWillAppear()
    }
    
    private func setup() {
        tabBar.clipsToBounds = true
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
    
    // MARK: - ITabBarController
    
    func setup(viewModels: [TabBarViewModel]) {
        let viewControllers: [UIViewController] = viewModels.map { viewModel in
            let viewController: UIViewController = tabBarViewControllersResolver.resolveViewController(
                type: viewModel.type
            )
            let navigationController: UINavigationController = UINavigationController(rootViewController: viewController)
            
            navigationController.tabBarItem = viewModel.tabBarItem
            navigationController.navigationBar.tintColor = .darkGray

            return navigationController
        }

        self.viewControllers = viewControllers
    }
}
