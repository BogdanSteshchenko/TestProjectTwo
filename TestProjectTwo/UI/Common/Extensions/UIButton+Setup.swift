//
//  UIButton+Setup.swift
//  TestProjectTwo
//
//  Created by Developer on 16.09.2022.
//

import UIKit

struct ButtonViewModel {
    let lokalizationId: String
    let action: () -> Void

    init(
        lokalizationId: String,
        action: @escaping () -> Void
    ) {
        self.lokalizationId = lokalizationId
        self.action = action
    }
}

struct ButtonViewModelFavorite {
    let condition: Bool
    let action: () -> Void
    
    init(
        condition: Bool,
        action: @escaping () -> Void
    ) {
        self.condition = condition
        self.action = action
    }
}

extension UIButton {
    
    func setup(with viewModel: ButtonViewModel) {
        apply()
        setTitle(NSLocalizedString(viewModel.lokalizationId, comment: ""), for: .normal)
        primaryActionClosure = viewModel.action
    }
    
    private func apply() {
        titleLabel?.font = .systemFont(ofSize: 15)
        titleLabel?.adjustsFontSizeToFitWidth = true
        backgroundColor = .lightGray
        setTitleColor(.black, for: .normal)
    }
    
    func setupAddFavorite(with viewModel: ButtonViewModelFavorite) {
        if viewModel.condition {
            setImage(UIImage(systemName: "heart.fill"), for: .normal)
            setImage(UIImage(systemName: "heart"), for: .highlighted)
            tintColor = .gray
            primaryActionClosure = viewModel.action
        } else {
            setImage(UIImage(systemName: "heart"), for: .normal)
            setImage(UIImage(systemName: "heart.fill"), for: .highlighted)
            tintColor = .gray
            primaryActionClosure = viewModel.action
        }
    }
}

struct ButtonNavigationBar {
    let title: String
    let action: () -> Void
    
    init(
        title: String,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.action = action
    }
}

extension UIBarButtonItem {
    
    func setup(with viewModel: ButtonNavigationBar) {
        title = NSLocalizedString(viewModel.title, comment: "")
        primaryActionClosure = viewModel.action
    }
}
