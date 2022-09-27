//
//  UIButton+Setup.swift
//  TestProjectTwo
//
//  Created by Developer on 16.09.2022.
//

import UIKit

struct ButtonViewModel {
    let title: String?
    let action: () -> Void

    init(
        title: String? = nil,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.action = action
    }
}

extension UIButton {
    
    func setup(with viewModel: ButtonViewModel) {
        apply()
        setTitle(viewModel.title, for: .normal)
        primaryActionClosure = viewModel.action
    }
    
    private func apply() {
        titleLabel?.font = UIFont(name: "Apple Symbols", size: 25)
        backgroundColor = .lightGray
        setTitleColor(.black, for: .normal)
    }
}

struct ButtonNavigationBar {
    let title: String?
    let action: () -> Void
    
    init(
        title: String?,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.action = action
    }
}

extension UIBarButtonItem {
    
    func setup(with viewModel: ButtonNavigationBar) {
        title = viewModel.title
        primaryActionClosure = viewModel.action
    }
}
