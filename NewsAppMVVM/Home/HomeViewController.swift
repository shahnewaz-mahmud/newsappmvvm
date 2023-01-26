//
//  HomeViewController.swift
//  NewsAppMVVM
//
//  Created by BJIT on 1/26/23.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
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
        homeViewModel.newsList.bind{ [weak self] _ in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
            
        }

        
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel.newsList.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newsCell = tableView.dequeueReusableCell(withIdentifier: Constants.newsTVCellId, for: indexPath) as! NewsTableViewCell
        newsCell.newsTitle.text = homeViewModel.newsList.value?[indexPath.row].title
        newsCell.newsDescription.text = homeViewModel.newsList.value?[indexPath.row].description
        
        return newsCell
    }
    
}

extension HomeViewController: UITableViewDelegate {
    
}
