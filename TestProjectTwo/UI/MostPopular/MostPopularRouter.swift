//
//  MostPopularRouter.swift
//  TestProjectTwo
//
//  Created by Developer on 19.09.2022.
//

import UIKit

protocol IMostPopularRouter {
    func showDeteilFavorite(article: ArticleModel)
    func errorNetwork(view: UIViewController?)
}

final class MostPopularRouter: IMostPopularRouter {
    
    // Dependencies
    weak var transitionHandler: UIViewController?
    private let deteilMostPopularAssembly: IDeteilArticlesAssembly
    
    //MARK: - Initialization
    init(deteilMostPopularAssembly: IDeteilArticlesAssembly) {
        self.deteilMostPopularAssembly = deteilMostPopularAssembly
    }
    
    //MARK: - IMostPopularRouter
    func showDeteilFavorite(article: ArticleModel) {
        let view: UIViewController = deteilMostPopularAssembly.assemble(article: article)
        transitionHandler?.navigationController?.pushViewController(view, animated: true)
    }
    
    func errorNetwork(view: UIViewController?) {
        guard let view = view else { return }
        view.navigationController?.popViewController(animated: true)
        AlertError.shared.alertError(title: NSLocalizedString("networkError", comment: ""), message: NSLocalizedString("tryNetwork", comment: ""), view: view)
    }
}
