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
    private let scrollView: UIScrollView = UIScrollView()
    private let imageArticle: UIImageView = {
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
        dateLabel.text = model?.publishedDate
        imageArticle.image = model?.image
        addFavoriteButton.setup(with: viewModel.addFavorite)
        shareUrlButton.setup(with: viewModel.shareUrl)
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
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints {
            $0.leading.equalTo(view.snp.leading)
            $0.trailing.equalTo(view.snp.trailing)
            $0.top.equalTo(view.snp.top)
            $0.bottom.equalTo(view.snp.bottom)
            scrollView.contentSize.height = 1000
        }
    }
    private func setupImageArticle() {
        scrollView.addSubview(imageArticle)
        imageArticle.snp.makeConstraints {
            $0.centerX.equalTo(scrollView.snp.centerX)
            $0.top.equalTo(scrollView.snp.top).offset(50)
            $0.height.equalTo(250)
            $0.width.equalTo(250)
        }
    }
    
    private func setupTitleLabel() {
        scrollView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.centerX.equalTo(scrollView.snp.centerX)
            $0.top.equalTo(imageArticle.snp.bottom).offset(10)
            $0.leading.equalTo(scrollView.snp.leading).offset(20)
        }
    }
    
    private func setupSectionLabel() {
        scrollView.addSubview(sectionLabel)
        sectionLabel.snp.makeConstraints {
            $0.centerX.equalTo(scrollView.snp.centerX)
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.leading.equalTo(scrollView.snp.leading).offset(20)
        }
    }
    
    private func setupAbstractLabel() {
        scrollView.addSubview(abstractLabel)
        abstractLabel.snp.makeConstraints {
            $0.centerX.equalTo(scrollView.snp.centerX)
            $0.top.equalTo(sectionLabel.snp.bottom).offset(10)
            $0.leading.equalTo(scrollView.snp.leading).offset(20)
        }
    }
    
    private func setupBylineLabel() {
        scrollView.addSubview(bylineLabel)
        bylineLabel.snp.makeConstraints {
            $0.centerX.equalTo(scrollView.snp.centerX)
            $0.top.equalTo(abstractLabel.snp.bottom).offset(25)
            $0.leading.equalTo(scrollView.snp.leading).offset(20)
        }
    }
    
    private func setupDateLabel() {
        scrollView.addSubview(dateLabel)
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(bylineLabel.snp.bottom).offset(25)
            $0.leading.equalTo(scrollView.snp.leading).offset(20)
            $0.width.equalTo(100)
        }
    }
    
    private func setupAddFavoriteButton() {
        scrollView.addSubview(addFavoriteButton)
        addFavoriteButton.snp.makeConstraints {
            $0.centerY.equalTo(dateLabel.snp.centerY)
            $0.leading.equalTo(dateLabel.snp.trailing).offset(25)
            $0.width.equalTo(170)
            $0.height.equalTo(27)
        }
    }
    
    private func setupShareUrl() {
        self.navigationItem.rightBarButtonItem = shareUrlButton
    }
}
