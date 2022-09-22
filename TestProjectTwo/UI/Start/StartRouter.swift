//
//  StartRouter.swift
//  TestProjectTwo
//
//  Created by Developer on 16.09.2022.
//

import UIKit

protocol IStartRouter {
    func showDetailMostEmailed()
    func showDetailMostShared()
    func showDetailMostViewed()
}

final class StartRouter: IStartRouter {
    
    // Dependencies
    weak var transitionHandler: UIViewController?
    private let mostPopularAssembly: IMostPopularAssembly
    
    
    // MARK: - Initialization
    
    init(
        mostPopularAssembly: IMostPopularAssembly
    ) {
        self.mostPopularAssembly = mostPopularAssembly
    }
    
    //MARK: - IStartRouter
    
    func showDetailMostEmailed() {
        let view: UIViewController = mostPopularAssembly.assemble(title: "Most emailed")
        transitionHandler?.navigationController?.pushViewController(view, animated: true)
    }
    
    func showDetailMostShared() {
        let view: UIViewController = mostPopularAssembly.assemble(title: "Most shared")
        transitionHandler?.navigationController?.pushViewController(view, animated: true)
    }
    
    func showDetailMostViewed() {
        let view: UIViewController = mostPopularAssembly.assemble(title: "Most viewed")
        transitionHandler?.navigationController?.pushViewController(view, animated: true)
    }
}
