//
//  MostPopularViewController.swift
//  TestProjectTwo
//
//  Created by Developer on 19.09.2022.
//

import UIKit
import SnapKit

protocol IMostPopularViewController: AnyObject {
    func setup(with viewModel: MostPopularViewModel)
    func reloadData()
}

final class MostPopularViewController: UIViewController, IMostPopularViewController {
    
    // Dependencies
    private let presenter: IMostPopularPresenter
    private let sectionTitle: String
    private var mostPopularViewModelForCell: [MostPopularViewModelCell]?
    
    // UI elements
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(ArticlesTableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let activity: UIActivityIndicatorView = {
        let ativity = UIActivityIndicatorView(style: .large)
        return ativity
        
    }()
    
    //MARK: - Initialization
    init(presenter: IMostPopularPresenter, sectionTitle: String) {
        self.presenter = presenter
        self.sectionTitle = sectionTitle
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        presenter.viewDidLoad(url: sectionTitle)
    }
    
    // MARK: - IMostPopularViewController
    func setup(with viewModel: MostPopularViewModel) {
        mostPopularViewModelForCell = viewModel.shelves
        reloadData()
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    
    
    //MARK: - Private
    private func setup() {
        setupViews()
        setupDelegate()
        setNavigationBar()
        setConstrains()
        
        view.backgroundColor = .white
    }
    
    private func setupViews() {
        view.addSubview(tableView)
        activity.center = view.center
        tableView.addSubview(activity)
        activity.startAnimating()
    }
    
    private func setupDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setNavigationBar() {
        title = sectionTitle
    }
}

//MARK: - Table View Data source
extension MostPopularViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mostPopularViewModelForCell?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? ArticlesTableViewCell else { return UITableViewCell() }

        guard let article = self.mostPopularViewModelForCell?[indexPath.row] else { return UITableViewCell() }

        cell.configureArticlesCell(with: article)
        activity.stopAnimating()
        
        return cell
    }
}

//MARK: - Table View Delegate
extension MostPopularViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didTapDeteilAcrticle(number: indexPath.row)
    }
}


//MARK: - Constrains
extension MostPopularViewController {
    private func setConstrains() {
        tableView.snp.makeConstraints {
            $0.trailing.equalTo(view.snp.trailing).offset(0)
            $0.leading.equalTo(view.snp.leading).offset(0)
            $0.top.equalTo(view.snp.top).offset(0)
            $0.bottom.equalTo(view.snp.bottom).offset(0)
        }
    }
}
