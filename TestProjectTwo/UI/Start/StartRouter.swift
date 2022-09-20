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
    private let mostEmailedAssembly: IMostPopularAssembly
    
    init(
        mostEmailedAssembly: IMostPopularAssembly
    ) {
        self.mostEmailedAssembly = mostEmailedAssembly
    }
    
    
    func showDetailMostEmailed() {
        print("1")
    }
    
    func showDetailMostShared() {
        print("2")
    }
    
    func showDetailMostViewed() {
        print("3")
    }
    
}
