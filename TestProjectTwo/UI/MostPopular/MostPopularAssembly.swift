//
//  MostPopularAssembly.swift
//  TestProjectTwo
//
//  Created by Developer on 19.09.2022.
//

import UIKit

protocol IMostPopularAssembly {
    func assemble() -> UIViewController
}

final class MostPopularAssembly: IMostPopularAssembly {
    func assemble() -> UIViewController {
        return UIViewController()
    }
    
    
}
