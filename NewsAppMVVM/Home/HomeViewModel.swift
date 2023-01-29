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

    /// to fetch news from API and set the loading flag
    func fetchNews() {
        isLoading.value = true
        APIService.syncNews { [weak self] newsList in
            self?.newsList.value = newsList
            self?.isLoading.value = false
        }
    }

    /// navigate to newsDetails page when clicked on a news cell
    ///
    /// This function is used to go to the news details view controller
    /// when a user clicked on a news cell of the tableview in homepage
    /// - Parameters:
    ///   - indexpath: index path of the selected tableView news cell
    ///   - originVC: ViewController where the tableView is located
    func goToNewsDetailsPage(indexpath: IndexPath, originVC: HomeViewController) {
        let newsDetailsVC = UIStoryboard(
            name: "Main", bundle: nil
        ).instantiateViewController(withIdentifier: Constants.newsDetailsVCId)
            as? NewsDetailsViewController

        guard let newsDetailsVC = newsDetailsVC else { return }

        newsDetailsVC.loadViewIfNeeded()

        newsDetailsVC.newsDetailsViewModel.setNewsDetails(newsDetails: newsList.value?[indexpath.row])
        originVC.navigationController?.pushViewController(newsDetailsVC, animated: true)
    }
}
