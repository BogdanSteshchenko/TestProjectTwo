//
//  DeteilFavoritesRouter.swift
//  TestProjectTwo
//
//  Created by Developer on 23.09.2022.
//

import UIKit

protocol IDeteilFavoritesRouter {
    func shareUrl(article: ArticleFavorite)
}

final class DeteilFavoritesRoute: IDeteilFavoritesRouter {
    
    // Dependencies
    weak var transitionHandler: DeteilFavoritesViewController?
    
    func shareUrl(article: ArticleFavorite) {
        guard let url = article.url else { return }
        if UIDevice.current.userInterfaceIdiom == .pad {
            let activityViewConroller = UIActivityViewController(activityItems: [url], applicationActivities: nil)
            
            activityViewConroller.popoverPresentationController?.sourceView = transitionHandler?.view

            guard let frame = transitionHandler?.navigationController?.accessibilityFrame else { return }
            activityViewConroller.popoverPresentationController?.sourceRect = frame
            transitionHandler?.present(activityViewConroller, animated: true)
            
        } else {
            let activityViewConroller = UIActivityViewController(activityItems: [url], applicationActivities: nil)
            transitionHandler?.present(activityViewConroller, animated: true)
        }
    }
}
