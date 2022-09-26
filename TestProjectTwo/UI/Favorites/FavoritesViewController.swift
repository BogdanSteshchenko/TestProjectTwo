//
//  FavoritesViewController.swift
//  TestProjectTwo
//
//  Created by Developer on 19.09.2022.
//

import UIKit

protocol IFavoritesViewController: AnyObject {
    func setup(with viewModel: FavoritesViewModel)
    func reloadData()
}

final class FavoritesViewController: UIViewController, IFavoritesViewController {
    
    //Dependencies
    private let presenter: IFavoritesPresenter
    private var favoritesViewModelForCell: [FavoritesViewModelCell]?
    
    //UI Elements
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(FavoritesTableViewCell.self, forCellReuseIdentifier: "CellFavorites")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    //MARK: - Initialization
    init(presenter: IFavoritesPresenter) {
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
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter.viewDidLoad()
    }
    
    // MARK: - IFavoritesViewController
    func setup(with viewModel: FavoritesViewModel) {
        favoritesViewModelForCell = viewModel.shelves
        
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
    }
    
    private func setupViews() {
        view.addSubview(tableView)
    }
    
    private func setupDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setNavigationBar() {
        title = "Favorite"
    }
    
    
}

//MARK: - Table View Data source
extension FavoritesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoritesViewModelForCell?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellFavorites", for: indexPath) as? FavoritesTableViewCell else { return UITableViewCell()}
        guard let article = self.favoritesViewModelForCell?[indexPath.row] else { return UITableViewCell() }
        cell.configureArticlesCell(with: article)
        
        return cell
    }
}

//MARK: - Table View Delegate
extension FavoritesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didTapDeteilAcrticle(number: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            presenter.deleteArticle(number: indexPath.row)
            presenter.viewDidLoad()
        }
    }
}

//MARK: - Constrains
extension FavoritesViewController {
    private func setConstrains() {
        tableView.snp.makeConstraints{
            $0.trailing.equalTo(view.snp.trailing).offset(0)
            $0.leading.equalTo(view.snp.leading).offset(0)
            $0.top.equalTo(view.snp.top).offset(0)
            $0.bottom.equalTo(view.snp.bottom).offset(0)
        }
    }
}

