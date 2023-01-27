//
//  HomeViewModel.swift
//  NewsAppMVVM
//
//  Created by BJIT on 1/26/23.
//

import Foundation
import UIKit

class HomeViewModel {
    var newsList: ObservableObject<[News]?> = ObservableObject(nil)
    var isLoading: ObservableObject<Bool> = ObservableObject(false)

    func fetchNews() {
        isLoading.value = true
        APIService.syncNews { [weak self] newsList in
            self?.newsList.value = newsList
            self?.isLoading.value = false
        }
    }

    func goToNewsDetailsPage(indexpath: IndexPath, originVC: HomeViewController) {
        let newsDetailsVC = UIStoryboard(
            name: "Main", bundle: nil
        ).instantiateViewController(withIdentifier: Constants.newsDetailsVCId)
            as? NewsDetailsViewController

        guard let newsDetailsVC = newsDetailsVC else { return }

        newsDetailsVC.loadViewIfNeeded()
        // UINavigationController(rootViewController: newsDetailsVC).pushViewController(newsDetailsVC, animated: true)

        // detailVC.detailViewModel.sendArticle(currentArticle: articlesList.value?[indexPath.row])

        newsDetailsVC.newsDetailsViewModel.setNewsDetails(newsDetails: newsList.value?[indexpath.row])
        originVC.present(newsDetailsVC, animated: true, completion: nil)
    }
}
