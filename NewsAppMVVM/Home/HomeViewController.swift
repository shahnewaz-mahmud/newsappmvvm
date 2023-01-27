//
//  HomeViewController.swift
//  NewsAppMVVM
//
//  Created by BJIT on 1/26/23.
//

import SDWebImage
import UIKit

class HomeViewController: UIViewController {
    @IBOutlet private var tableView: UITableView!
    @IBOutlet var loadingActivity: UIActivityIndicatorView!

    var homeViewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self

        setupBinders()
        homeViewModel.fetchNews()

        let newsNib = UINib(nibName: Constants.newsTVCellId, bundle: nil)
        tableView.register(newsNib, forCellReuseIdentifier: Constants.newsTVCellId)
    }

    func setupBinders() {
        homeViewModel.newsList.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }

        homeViewModel.isLoading.bind { [weak self] isLoading in
            DispatchQueue.main.async {
                if isLoading {
                    self?.loadingActivity.startAnimating()
                } else {
                    self?.loadingActivity.stopAnimating()
                }
            }
        }
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return homeViewModel.newsList.value?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newsCell = tableView.dequeueReusableCell(
            withIdentifier: Constants.newsTVCellId, for: indexPath
        ) as? NewsTableViewCell
        guard let newsCell = newsCell else { return UITableViewCell() }

        newsCell.newsTitle.text = homeViewModel.newsList.value?[indexPath.row].title
        newsCell.newsDescription.text = homeViewModel.newsList.value?[indexPath.row].description
        newsCell.newsTime.text = homeViewModel.newsList.value?[indexPath.row].publishedAt
        newsCell.newsAuthor.text = homeViewModel.newsList.value?[indexPath.row].author
        newsCell.newsImage.sd_setImage(
            with: URL(string: homeViewModel.newsList.value?[indexPath.row].urlToImage ?? ""),
            placeholderImage: UIImage(named: "news")
        )

        return newsCell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        homeViewModel.goToNewsDetailsPage(indexpath: indexPath, originVC: self)
    }
}
