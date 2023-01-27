//
//  NewsTableViewCell.swift
//  NewsAppMVVM
//
//  Created by BJIT on 1/26/23.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    @IBOutlet var newsImage: UIImageView!
    @IBOutlet var newsTitle: UILabel!
    @IBOutlet var newsDescription: UILabel!
    @IBOutlet var newsTime: UILabel!
    @IBOutlet var newsAuthor: UILabel!
    @IBOutlet var newsBackground: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        newsBackground.layer.cornerRadius = 5
        newsImage.layer.cornerRadius = 20

        newsBackground.dropShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension UIView {
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 0.15
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 10
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
