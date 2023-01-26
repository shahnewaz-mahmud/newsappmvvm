//
//  NewsTableViewCell.swift
//  NewsAppMVVM
//
//  Created by BJIT on 1/26/23.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsDescription: UILabel!
    @IBOutlet weak var newsTime: UILabel!
    @IBOutlet weak var newsAuthor: UILabel!
    
    @IBOutlet weak var newsBackground: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        newsBackground.layer.cornerRadius = 5
        newsImage.layer.cornerRadius = 20
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
