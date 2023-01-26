//
//  APIService.swift
//  NewsAppMVVM
//
//  Created by BJIT on 1/26/23.
//

import Foundation

final class APIService {
    
    private init() {}
    
    static func syncNews (completion: @escaping ([News]?) -> ()) {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&pageSize=10&apiKey=814ef7e4f7c049458f9d2e26cfec78a0") else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("There was an error: \(error.localizedDescription)")
            } else {
                let newsList = try! JSONDecoder().decode(NewsList.self, from: data!)
                
                if let articles = newsList.articles {
                    completion(articles)
                }
            }

        }.resume()
    }
}
