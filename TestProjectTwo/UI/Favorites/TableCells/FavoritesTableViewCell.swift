//
//  FavoritesTableViewCell.swift
//  TestProjectTwo
//
//  Created by Developer on 21.09.2022.
//

import UIKit

final class FavoritesTableViewCell: UITableViewCell {
    
    //UI element
    private let articlesLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    private let nameArticlesLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    private let dateArticlesLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    //MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setConsrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Method
    private func setupViews() {
        self.backgroundColor = .clear
        self.selectionStyle = .none
        self.addSubview(articlesLogo)
        self.addSubview(nameArticlesLabel)
        self.addSubview(dateArticlesLabel)
        
    }
    
    func configureArticlesCell(with viewModelCell: FavoritesViewModelCell) {
        nameArticlesLabel.text = viewModelCell.nameArticles
        dateArticlesLabel.text = viewModelCell.dateArticlesLabel
        getImage(imageData: viewModelCell.imageArticles)
    }
    
    
    private func getImage(imageData: Data?) {
        if let imageData = imageData {
            let image = UIImage(data: imageData)
            articlesLogo.image = image
        } else {
            articlesLogo.image = UIImage(named: "default")
        }
    }

    //MARK: - Constrains
    private func setConsrains() {
        articlesLogo.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(self.snp.leading).offset(15)
            $0.height.equalTo(75)
            $0.width.equalTo(75)
        }
        nameArticlesLabel.snp.makeConstraints {
            $0.trailing.equalTo(self.snp.trailing).offset(-10)
            $0.leading.equalTo(articlesLogo.snp.trailing).offset(10)
            $0.top.equalTo(self.snp.top).offset(10)
        }
        dateArticlesLabel.snp.makeConstraints{
            $0.bottom.equalTo(self.snp.bottom).offset(0)
            $0.width.equalTo(120)
            $0.trailing.equalTo(self.snp.trailing).offset(10)
        }
    }
}


