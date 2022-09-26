//
//  StartViewController.swift
//  TestProjectTwo
//
//  Created by Developer on 16.09.2022.
//

import UIKit
import SnapKit

protocol IStartViewController: AnyObject {
    func setup(with viewModel: StartViewModel)
}

final class StartViewController: UIViewController, IStartViewController {
    
    // Dependencies
    private let presenter: IStartPresenter
    
    // UI elements
    private let mostEmailedButton: UIButton = UIButton(type: .system)
    private let mostSharedButton: UIButton = UIButton(type: .system)
    private let mostViewedButton: UIButton = UIButton(type: .system)
    
    // MARK: - Initialization
    init(presenter: IStartPresenter) {
        self.presenter = presenter
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
        presenter.viewDidLoad()
    }
    
    //MARK: - IStartViewController
    func setup(with viewModel: StartViewModel) {
        mostEmailedButton.setup(with: viewModel.mostEmailedButtonModel)
        mostSharedButton.setup(with: viewModel.mostSharedButtonModel)
        mostViewedButton.setup(with: viewModel.mostViewedButtonModel)
    }
    
    // MARK: - Private
    private func setup() {
        setupMostSharedButton()
        setupMostEmailedButton()
        setupMostViewedButton()
    }
    private func setupMostEmailedButton() {
        view.addSubview(mostEmailedButton)
        mostEmailedButton.snp.makeConstraints {
            $0.bottom.equalTo(mostSharedButton.snp.top).offset(-40)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(250)
            $0.height.equalTo(37)
        }
    }
    private func setupMostSharedButton() {
        view.addSubview(mostSharedButton)
        mostSharedButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.equalTo(250)
            $0.height.equalTo(37)
        }
    }
    private func setupMostViewedButton() {
        view.addSubview(mostViewedButton)
        mostViewedButton.snp.makeConstraints {
            $0.top.equalTo(mostSharedButton.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(250)
            $0.height.equalTo(37)
        }
    }
}

