//
//  DeteilMostPopularViewController.swift
//  TestProjectTwo
//
//  Created by Developer on 22.09.2022.
//

import UIKit
import SnapKit

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
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    private let sectionLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    private let abstractLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    private let bylineLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
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
        sectionLabel.text = model?.section
        abstractLabel.text = model?.abstract
        bylineLabel.text = model?.byline
        dateLabel.text = model?.published_date
        imageArticle.image = model?.image
        addFavoriteButton.setup(with: viewModel.addFavorite)
    }
    
    //MARK: - Private
    private func setup() {
        setupImageArticle()
        setupTitleLabel()
        setupSectionLabel()
        setupAbstractLabel()
        setupBylineLabel()
        setupDateLabel()
//        setupAddFavoriteButton()
        setupAddFavoriteButton2()
        
        view.backgroundColor = .white
    }
    private func setupImageArticle() {
        view.addSubview(imageArticle)
        NSLayoutConstraint.activate([
            imageArticle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageArticle.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            imageArticle.heightAnchor.constraint(equalToConstant: 250),
            imageArticle.widthAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    private func setupTitleLabel() {
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: imageArticle.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
    
    private func setupSectionLabel() {
        view.addSubview(sectionLabel)
        NSLayoutConstraint.activate([
            sectionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sectionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            sectionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])

    }
    
    private func setupAbstractLabel() {
        view.addSubview(abstractLabel)
        NSLayoutConstraint.activate([
            abstractLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            abstractLabel.topAnchor.constraint(equalTo: sectionLabel.bottomAnchor, constant: 10),
            abstractLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
    
    private func setupBylineLabel() {
        view.addSubview(bylineLabel)
        NSLayoutConstraint.activate([
            bylineLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bylineLabel.topAnchor.constraint(equalTo: abstractLabel.bottomAnchor, constant: 25),
            bylineLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
    
    private func setupDateLabel() {
        view.addSubview(dateLabel)
        NSLayoutConstraint.activate([
            dateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dateLabel.topAnchor.constraint(equalTo: bylineLabel.bottomAnchor, constant: 25),
            dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
    
    private func setupAddFavoriteButton() {
        view.addSubview(addFavoriteButton)
        NSLayoutConstraint.activate([
            addFavoriteButton.widthAnchor.constraint(equalToConstant: 70),
            addFavoriteButton.heightAnchor.constraint(equalToConstant: 37),
            addFavoriteButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            addFavoriteButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 50)
        ])
    }
    
    private func setupAddFavoriteButton2() {
        view.addSubview(addFavoriteButton)
        addFavoriteButton.snp.makeConstraints {
            $0.centerY.equalTo(dateLabel.snp.centerY)
            $0.leading.equalTo(dateLabel)
            $0.width.equalTo(150)
            $0.height.equalTo(27)
        }
    }
}
