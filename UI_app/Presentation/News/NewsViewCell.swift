//
//  NewsViewCell.swift
//  UI_app
//
//  Created by Вячеслав on 04.09.2021.
//

import UIKit

class NewsViewCell: UITableViewCell {

    static let identifier = "NewsViewCell"
    var likeTapped: ((Bool) -> Void)?
    
    @IBOutlet private var NewsImageCell: UIImageView!
    @IBOutlet private var NewsLabelCell: UILabel!
    @IBOutlet private var Like: Like!
    
    func configure(news: NewsDB) {
        NewsImageCell.loadPhoto(url: news.photo200)
        NewsLabelCell.text = news.name
//        NewsImageCell.layer.cornerRadius = 10
//        Like.configure(isLike: (news.likes.userLikes != 0), count: news.likes.count)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        Like.addTarget(self, action: #selector(likeChanged), for: .valueChanged)
    }
    
    @objc private func likeChanged() {
        likeTapped?(Like.isLike)
    }
    
}
