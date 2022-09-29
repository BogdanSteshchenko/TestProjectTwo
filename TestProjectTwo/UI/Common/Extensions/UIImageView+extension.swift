//
//  UIImageView+extension.swift
//  TestProjectTwo
//
//  Created by Developer on 29.09.2022.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(with url: URL?, placeholder: UIImage?) {
        kf.setImage(with: url, placeholder: placeholder)
    }
}
