//
//  ArticlesModel.swift
//  TestProjectTwo
//
//  Created by Developer on 19.09.2022.
//

import Foundation

struct ArticlesModel: Decodable {
    let results: [Article]
}

struct Article: Decodable {
    let url: String
    let id: Int64
    let publishedDate: String
    let section: String
    let byline: String
    let title: String
    let abstract: String
    let media: [Media]?
    
    enum CodingKeys: String, CodingKey {
        case url
        case id
        case publishedDate = "published_date"
        case section
        case byline
        case title
        case abstract
        case media
    }
}

struct Media: Decodable {
    let mediaMetadata: [MediaMetadata]
    
    enum CodingKeys: String, CodingKey {
        case mediaMetadata = "media-metadata"
    }
}

struct MediaMetadata: Decodable {
    let url: String
}
