//
//  DeteilMostPopularViewController.swift
//  TestProjectTwo
//
//  Created by Developer on 22.09.2022.
//

import UIKit

protocol IDeteilMostPopularViewController {
    func setup(with viewModel: DeteilMostPopularViewModel)
}

final class DeteilMostPopularViewController: UIViewController,
    IDeteilMostPopularViewController {
    
    // Dependencies
    private let presenter: IDeteilMostPopularPresenter
    private let article: Article
    private var model: DeteilMostPopularViewModel?
    
    // UI elements
    private let imageArticle: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private let titleLabel: UILabel = UILabel()
    private let sectionLabel: UILabel = UILabel()
    private let abstractLabel: UILabel = UILabel()
    private let bylineLabel: UILabel = UILabel()
    private let dateLabel: UILabel = UILabel()
    
    private let addFavoriteButton: UIButton = UIButton(type: .system)
    
    // MARK: - Initialization
    
    init(presenter: IDeteilMostPopularPresenter, article: Article) {
        self.presenter = presenter
        self.article = article
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        presenter.viewDidLoad(article: article)
    }
    
    //MARK: - IDeteilMostPopularViewController
    
    func setup(with viewModel: DeteilMostPopularViewModel) {
        model = viewModel
        titleLabel.text = model?.title
        sectionLabel.text = "Section: \(String(describing: model?.section))"
        abstractLabel.text = model?.abstract
        bylineLabel.text = model?.byline
        dateLabel.text = model?.published_date
        imageArticle.image = model?.image
    }
    
    //MARK: - Private
    
    private func setup() {
        setupImageArticle()
        setupTitleLabel()
        setupSectionLabel()
        setupAbstractLabel()
        setupDateLabel()
        setupAddFavoriteButton()
    }
    
    private func setupImageArticle() {
        view.addSubview(imageArticle)
        NSLayoutConstraint.activate([
            imageArticle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageArticle.topAnchor.constraint(equalTo: view.topAnchor, constant: 151),
            imageArticle.heightAnchor.constraint(equalToConstant: 250),
            imageArticle.widthAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    private func setupTitleLabel() {
        view.addSubview(titleLabel)
    }
    
    private func setupSectionLabel() {
        view.addSubview(sectionLabel)
    }
    
    private func setupAbstractLabel() {
        view.addSubview(abstractLabel)
    }
    
    private func setupBylineLabel() {
        view.addSubview(bylineLabel)
    }
    
    private func setupDateLabel() {
        view.addSubview(dateLabel)
    }
    
    private func setupAddFavoriteButton() {
        view.addSubview(addFavoriteButton)
    }
}
