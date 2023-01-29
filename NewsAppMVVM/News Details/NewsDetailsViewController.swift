//
//  NewsDetailsViewController.swift
//  NewsAppMVVM
//
//  Created by BJIT on 1/27/23.
//

import SDWebImage
import UIKit

class NewsDetailsViewController: UIViewController {
    @IBOutlet private var newsImage: UIImageView!
    @IBOutlet private var newsTitle: UILabel!
    @IBOutlet private var newsTime: UILabel!
    @IBOutlet private var newsAuthor: UILabel!
    @IBOutlet private var newsDescription: UILabel!
    @IBOutlet private var newsContent: UILabel!

    var newsDetailsViewModel = NewsDetailsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinders()
    }

    /// this is a binder function which executes whenever newsDetails is updated
    func setupBinders() {
        newsDetailsViewModel.newsDetails.bind { [weak self] newsDetails in
            self?.newsTitle.text = newsDetails?.title
            self?.newsTime.text = newsDetails?.publishedAt
            self?.newsAuthor.text = newsDetails?.author
            self?.newsDescription.text = newsDetails?.description
            self?.newsContent.text = newsDetails?.content
            self?.newsImage.sd_setImage(
                with: URL(string: newsDetails?.urlToImage ?? ""),
                placeholderImage: UIImage(named: "news")
            )
        }
    }
}
