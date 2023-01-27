//
//  News.swift
//  NewsAppMVVM
//
//  Created by BJIT on 1/26/23.
//

import Foundation

struct News: Encodable, Decodable {
    let title: String?
    let author: String?
    let description: String?
    let url: String?
    var urlToImage: String?
    let publishedAt: String?
    var content: String?
}
