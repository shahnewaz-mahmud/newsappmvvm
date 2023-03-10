//
//  APIService.swift
//  NewsAppMVVM
//
//  Created by BJIT on 1/26/23.
//

import Foundation

final class APIService {
    private init() {}

    /// sync all news from news API
    ///
    /// Here completion closure is used to take the news array and use where the closure is defined
    /// (ex: from HomeViewModel)
    /// - Parameter completion: this is a closure which takes an array of News and returns void
    static func syncNews(completion: @escaping ([News]?) -> Void) {
        guard let url = URL(string: Constants.API)
        else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("There was an error: \(error.localizedDescription)")
            } else {
                if let data = data {
                    let newsList = try? JSONDecoder().decode(NewsList.self, from: data)

                    if let articles = newsList?.articles {
                        completion(articles)
                    }
                }
            }
        }.resume()
    }
}
