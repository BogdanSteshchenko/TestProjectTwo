//
//  UIButton+Action.swift
//  TestProjectTwo
//
//  Created by Developer on 19.09.2022.
//

import UIKit

private final class ActionClosureWrapper: NSObject {
    let closure: (() -> Void)?
    init(closure: (() -> Void)?) {
        self.closure = closure
    }
}

extension UIButton {

    private struct AssociatedKeys {
        static var primaryActionClosure: Int = 0
    }

    var primaryActionClosure: (() -> Void)? {
        get {
            let wrapper: ActionClosureWrapper? = objc_getAssociatedObject(self, &AssociatedKeys.primaryActionClosure) as? ActionClosureWrapper
            return wrapper?.closure
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.primaryActionClosure, ActionClosureWrapper(closure: newValue), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            self.addTarget(self, action: #selector(onPrimaryAction(_:)), for: .primaryActionTriggered)
        }
    }

    @objc private func onPrimaryAction(_ sender: UIButton) {
        primaryActionClosure?()
    }
}

extension UIBarButtonItem {

    private struct AssociatedKeys {
        static var primaryActionClosure: Int = 0
    }

    var primaryActionClosure: (() -> Void)? {
        get {
            let wrapper: ActionClosureWrapper? = objc_getAssociatedObject(self, &AssociatedKeys.primaryActionClosure) as? ActionClosureWrapper
            return wrapper?.closure
        }
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.primaryActionClosure, ActionClosureWrapper(closure: newValue), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            self.target = self
            self.action = #selector(onPrimaryAction(_:))
        }
    }

    @objc private func onPrimaryAction(_ sender: UIButton) {
        primaryActionClosure?()
    }
}

