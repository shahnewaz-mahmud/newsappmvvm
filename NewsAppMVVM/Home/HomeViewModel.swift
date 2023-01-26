//
//  HomeViewModel.swift
//  NewsAppMVVM
//
//  Created by BJIT on 1/26/23.
//

import Foundation

class HomeViewModel {
    
    var newsList: ObservableObject<[News]?> = ObservableObject(nil)
    
    func fetchNews() {
        APIService.syncNews{ [weak self] newsList in
            self?.newsList.value = newsList}
    }
}


