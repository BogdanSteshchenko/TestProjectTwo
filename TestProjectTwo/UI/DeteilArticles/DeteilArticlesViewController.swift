//
//  DeteilArticlesViewController.swift
//  TestProjectTwo
//
//  Created by Developer on 22.09.2022.
//

import UIKit

protocol IDeteilArticlesViewController {
    func setup(with viewModel: DeteilArticlesViewModel)
}

final class DeteilArticlesViewController: UIViewController,
    IDeteilArticlesViewController {
    
    // Dependencies
    private let presenter: IDeteilArticlesPresenter
    private let article: Article?
    private let articleFavorite: ArticleFavorite?
    private var model: DeteilArticlesViewModel?
    
    // UI elements
    private let scrollViewConroller: UIScrollView = UIScrollView()
    private let rticleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    private let sectionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    private let abstractLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    private let bylineLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    private let addFavoriteButton: UIButton = UIButton(type: .system)
    private let shareUrlButton: UIBarButtonItem = UIBarButtonItem()
    
    // MARK: - Initialization
    init(presenter: IDeteilArticlesPresenter, article: Article?, articleFavorite: ArticleFavorite?) {
        self.presenter = presenter
        self.article = article
        self.articleFavorite = articleFavorite
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        if article != nil {
            presenter.viewDidLoad(article: article, articleFavorite: nil)
        } else {
            presenter.viewDidLoad(article: nil, articleFavorite: articleFavorite)
        }
    }
    
    //MARK: - IDeteilMostPopularViewController
    func setup(with viewModel: DeteilArticlesViewModel) {
        model = viewModel
        titleLabel.text = model?.title
        sectionLabel.text = model?.section
        abstractLabel.text = model?.abstract
        bylineLabel.text = model?.byline
        dateLabel.text = model?.publishedDate
        addFavoriteButton.setupAddFavorite(with: viewModel.addFavorite)
        shareUrlButton.setup(with: viewModel.shareUrl)
        
        if let urlString = model?.image,
           let url = URL(string: urlString) {
            rticleImageView.setImage(with: url, placeholder: nil)
        } else {
            rticleImageView.setImage(with: nil, placeholder: UIImage(named: "default"))
        }
    }
    
    //MARK: - Private
    private func setup() {
        setupScrollView()
        setupImageArticle()
        setupTitleLabel()
        setupSectionLabel()
        setupAbstractLabel()
        setupBylineLabel()
        setupDateLabel()
        setupAddFavoriteButton()
        setupShareUrl()
        
        view.backgroundColor = .systemBackground
    }
    private func setupScrollView() {
        view.addSubview(scrollViewConroller)
        scrollViewConroller.snp.makeConstraints {
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
            scrollViewConroller.contentSize.height = 1000
        }
    }
    private func setupImageArticle() {
        scrollViewConroller.addSubview(rticleImageView)
        rticleImageView.snp.makeConstraints {
            $0.centerX.equalTo(scrollViewConroller.snp.centerX)
            $0.top.equalTo(scrollViewConroller.snp.top).offset(50)
            $0.height.equalTo(250)
            $0.width.equalTo(250)
        }
    }
    
    private func setupTitleLabel() {
        scrollViewConroller.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.centerX.equalTo(scrollViewConroller.snp.centerX)
            $0.top.equalTo(rticleImageView.snp.bottom).offset(10)
            $0.leading.equalTo(scrollViewConroller.snp.leading).offset(20)
        }
    }
    
    private func setupSectionLabel() {
        scrollViewConroller.addSubview(sectionLabel)
        sectionLabel.snp.makeConstraints {
            $0.centerX.equalTo(scrollViewConroller.snp.centerX)
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.leading.equalTo(scrollViewConroller.snp.leading).offset(20)
        }
    }
    
    private func setupAbstractLabel() {
        scrollViewConroller.addSubview(abstractLabel)
        abstractLabel.snp.makeConstraints {
            $0.centerX.equalTo(scrollViewConroller.snp.centerX)
            $0.top.equalTo(sectionLabel.snp.bottom).offset(10)
            $0.leading.equalTo(scrollViewConroller.snp.leading).offset(20)
        }
    }
    
    private func setupBylineLabel() {
        scrollViewConroller.addSubview(bylineLabel)
        bylineLabel.snp.makeConstraints {
            $0.centerX.equalTo(scrollViewConroller.snp.centerX)
            $0.top.equalTo(abstractLabel.snp.bottom).offset(25)
            $0.leading.equalTo(scrollViewConroller.snp.leading).offset(20)
        }
    }
    
    private func setupDateLabel() {
        scrollViewConroller.addSubview(dateLabel)
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(bylineLabel.snp.bottom).offset(25)
            $0.leading.equalTo(scrollViewConroller.snp.leading).offset(20)
            $0.width.equalTo(100)
        }
    }
    
    private func setupAddFavoriteButton() {
        scrollViewConroller.addSubview(addFavoriteButton)
        addFavoriteButton.snp.makeConstraints {
            $0.centerY.equalTo(dateLabel.snp.centerY)
            $0.leading.equalTo(dateLabel.snp.trailing).offset(150)
            $0.width.equalTo(27)
            $0.height.equalTo(27)
        }
    }
    
    private func setupShareUrl() {
        self.navigationItem.rightBarButtonItem = shareUrlButton
    }
}
