//
//  NewsList.swift
//  NewsAppMVVM
//
//  Created by BJIT on 1/26/23.
//

import Foundation

struct NewsList: Encodable, Decodable {
    var articles: [News]?
}
