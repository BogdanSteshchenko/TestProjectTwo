//
//  MostPopularRouter.swift
//  TestProjectTwo
//
//  Created by Developer on 19.09.2022.
//

import UIKit

protocol IMostPopularRouter {
    func showDeteilFavorite(article: Article)
}

final class MostPopularRouter: IMostPopularRouter {
    
    // Dependencies
    weak var transitionHandler: UIViewController?
    private let deteilMostPopularAssembly: IDeteilMostPopularAssembly
    
    // MARK: - Initialization
    
    init(deteilMostPopularAssembly: IDeteilMostPopularAssembly) {
        self.deteilMostPopularAssembly = deteilMostPopularAssembly
    }
    
    //MARK: - IMostPopularRouter
    
    func showDeteilFavorite(article: Article) {
        let view: UIViewController = deteilMostPopularAssembly.assemble(article: article)
        transitionHandler?.navigationController?.pushViewController(view, animated: true)
    }
}
