//
//  StartViewModelFactory.swift
//  TestProjectTwo
//
//  Created by Developer on 16.09.2022.
//

import UIKit

protocol IStartViewModelFactory {
    func makeViewModel(actions: StartActions) -> StartViewModel
}

final class StartViewModelFactory: IStartViewModelFactory {
    
    // MARK: - IStartViewModelFactory
    
    func makeViewModel(actions: StartActions) -> StartViewModel {
        .init(
            barButtonImage: UIImage(systemName: "book.fill")!,
            barButtonTitle: "Articles",
            mostEmailedButtonModel: makeMostEmailedButtonModel(actions: actions),
            mostSharedButtonModel: makeMostSharedButtonModel(actions: actions),
            mostViewedButtonModel: makeMostViewedButtonModel(actions: actions)
        )
    }
    
    
    //MARK: - Private
    
    private func makeMostEmailedButtonModel(actions: StartActions) -> ButtonViewModel {
        .init(
            title: "Most emailed",
            action: { [weak actions] in
                actions?.didTapMostEmailed()
            }
        )
    }
    
    private func makeMostSharedButtonModel(actions: StartActions) -> ButtonViewModel {
        .init(
            title: "Most shared",
            action: { [weak actions] in
                actions?.didTapMostShared()
            }
        )
    }
    
    private func makeMostViewedButtonModel(actions: StartActions) -> ButtonViewModel {
        .init(
            title: "Most viewed",
            action: { [weak actions] in
                actions?.didTapMostViewed()
            }
        )
    }
}

