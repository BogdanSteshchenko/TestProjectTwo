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
        let view: UIViewController = mostPopularAssembly.assemble(type: .mostEmailed)
        transitionHandler?.navigationController?.pushViewController(view, animated: true)
    }
    
    func showDetailMostShared() {
        let view: UIViewController = mostPopularAssembly.assemble(type: .mostShared)
        transitionHandler?.navigationController?.pushViewController(view, animated: true)
    }
    
    func showDetailMostViewed() {
        let view: UIViewController = mostPopularAssembly.assemble(type: .mostViewed)
        transitionHandler?.navigationController?.pushViewController(view, animated: true)
    }
}
