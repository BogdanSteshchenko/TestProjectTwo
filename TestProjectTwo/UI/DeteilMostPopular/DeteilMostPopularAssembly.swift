//
//  DeteilMostPopularAssembly.swift
//  TestProjectTwo
//
//  Created by Developer on 22.09.2022.
//

import UIKit

protocol IDeteilMostPopularAssembly {
    func assemble(article: Article) -> UIViewController
}

final class DeteilMostPopularAssembly: IDeteilMostPopularAssembly {
    func assemble(article: Article) -> UIViewController {
        let viewModelFactory: DeteilMostPopularFactory = DeteilMostPopularFactory()
        let router: DeteilMostPopularRouter = DeteilMostPopularRouter()
        let presenter: DeteilMostPopularPresenter = DeteilMostPopularPresenter(viewModelFactory: viewModelFactory, router: router)
        let view = DeteilMostPopularViewController(presenter: presenter, article: article)
        presenter.view = view
        
        
        return view
    }    
}
