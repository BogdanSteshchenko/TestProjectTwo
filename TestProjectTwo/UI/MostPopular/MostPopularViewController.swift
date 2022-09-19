//
//  MostPopularViewController.swift
//  TestProjectTwo
//
//  Created by Developer on 19.09.2022.
//

import UIKit

//class MostPopularViewController: UIViewController {
//    
//    let sectionTitle: String
//    
//    private let tableView: UITableView = {
//        let tableView = UITableView()
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        return tableView
//    }()
//    
//    private let activity: UIActivityIndicatorView = {
//        let ativity = UIActivityIndicatorView(style: .large)
//        return ativity
//        
//    }()
//    
//    init?(sectionTitle: String) {
//        self.sectionTitle = sectionTitle
//        super.init(nibName: nil, bundle: nil)    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        setupViews()
//        setupDelegate()
//        setNavigationBar()
//        setConstrains()
//    }
//    //MARK: - Method
//    private func setupViews() {
//        view.addSubview(tableView)
//        activity.center = view.center
//        tableView.addSubview(activity)
//        activity.startAnimating()
//    }
//    
//    private func setupDelegate() {
//        tableView.delegate = self
//        tableView.dataSource = self
//    }
//    
//    private func setNavigationBar() {
//        navigationItem.title = sectionTitle
//    }
//}
//
////MARK: - Table View Data source
//extension PopularArticlesViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 10
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//
//        cell.textLabel?.text = "sdasda"
//        return cell
//    }
//}
//
////MARK: - Table View Delegate
//extension PopularArticlesViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        80
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//        let detailArticlesViewContoller = storyboard.instantiateViewController(withIdentifier: "articlesDetail") as! DetailArticlesViewContoller
//        let article = articles[indexPath.row]
//        detailArticlesViewContoller.article = article
//        navigationController?.pushViewController(detailArticlesViewContoller, animated: true)
//    }
//
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        let myDel = UIContextualAction(style: .destructive, title: nil) { [weak self]  _, view, _ in
//            DispatchQueue.main.async {
//                WorkCoreDate.shared.createItem(article: (self?.articles[indexPath.row])!)
//            }
//            tableView.reloadRows(at: [indexPath], with: .fade)
//        }
//        myDel.image = UIImage(systemName: "star.fill")
//        myDel.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
//        return UISwipeActionsConfiguration(actions: [myDel])
//    }
//}
//
//
////MARK: - Constrains
//extension PopularArticlesViewController {
//    private func setConstrains() {
//        NSLayoutConstraint.activate([
//            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
//            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
//            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
//            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
//        ])
//    }
//}
//
