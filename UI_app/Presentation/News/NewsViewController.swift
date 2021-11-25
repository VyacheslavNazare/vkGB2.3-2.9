//
//  NewsViewController.swift
//  UI_app
//
//  Created by Вячеслав on 04.09.2021.
//

import UIKit

class NewsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let newsAPI = NewsAPI()
    var news: [NewsDB] = []
 
    
//    let storage: NewsStorage = NewsStorage()
//    var news: [NewsModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        news = storage.news
        tableView.delegate = self
        tableView.dataSource = self
        newsAPI.getNews{ [weak self] news in
            guard let self = self else { return}
            print("NNNNNEEEEEWWWWWWSSSSS")
            self.news = news
            self.tableView.reloadData()
        }
        

    }
}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NewsViewCell.identifier, for: indexPath) as! NewsViewCell
        
        let new = news[indexPath.item]


        cell.configure(news: new)
//        cell.likeTapped = { [weak self] islike in
//            self?.news[indexPath.item].isLike = islike
//        }
        return cell
    }
    
    
}


