//
//  NewsDetailsViewModel.swift
//  NewsAppMVVM
//
//  Created by BJIT on 1/27/23.
//

import Foundation

class NewsDetailsViewModel {
    var newsDetails: ObservableObject<News?> = ObservableObject(nil)

    func setNewsDetails(newsDetails: News?) {
        self.newsDetails.value = newsDetails
    }
}
