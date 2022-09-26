//
//  AlertError.swift
//  TestProjectTwo
//
//  Created by Developer on 20.09.2022.
//

import UIKit

class AlertError {
    
    static let shared = AlertError()
    
    // MARK: - Initialization
    private init() {
    }
    
    func alertError(title: String, message: String, view: UIViewController) {
        let alertContoller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let allrtOk = UIAlertAction(title: "Ок", style: .cancel)
        
        alertContoller.addAction(allrtOk)
        
        view.present(alertContoller, animated: true)
    }
}
