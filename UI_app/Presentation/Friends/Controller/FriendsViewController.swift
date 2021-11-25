//
//  FriendsViewController.swift
//  UI_app
//
//  Created by Вячеслав on 11.08.2021.
//

import UIKit
import RealmSwift

class FriendsViewController: UIViewController {

    private let friendsAPI = FriendsAPI()
    private let friendsDB = FriendsDB()
    private var friends: Results<FriendsModel>?
    private var token: NotificationToken?
    
    

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController!.navigationBar.tintColor = UIColor.black

        tableView.delegate = self
        tableView.dataSource = self
        friendsAPI.getFriends { [weak self] friends in
            guard let self = self else { return }
//            self.friends = friends
//            self.tableView.reloadData()
            self.friendsDB.save(friends)
            self.friends = self.friendsDB.load()
            self.token = self.friends?.observe { [weak self] changes in
                self?.tableView.reloadData()
            }
        }
    }
        
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveToFriend" {
            
            guard
                let destinationVC = segue.destination as? GalleryViewController,
                let indexSelectCell = tableView.indexPathForSelectedRow?.row
            else { return }
            
            let selectFriend = String(((friends?[indexSelectCell].id)!))
            PhotoAPI.sharedId = selectFriend
            destinationVC.title = friends?[indexSelectCell].fullName
            }
        return
    }

//    @IBAction func addFriend(_ segue: UIStoryboardSegue) {
//        guard
//            let sourceController = segue.source as? AllFriendViewController,
//            let indexSelectCell = sourceController.tableView.indexPathForSelectedRow
//
//        else { return }
//
//        let friend = sourceController.sortedFriends[indexSelectCell.section][indexSelectCell.row]
//
//        if !friends.contains(where: { friend.name == $0.name }) {
//            friends.append(friend)
//        }
//        tableView.reloadData()
//    }
    
}


extension FriendsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection selection: Int) -> Int {
        
        guard let friends = friends else { return 0 }
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FriendsTableViewCell.identifier) as! FriendsTableViewCell
        cell.configure(friend: (friends?[indexPath.row]) as! FriendsModel)
        return cell
    }
    
    
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        // Если была нажата кнопка «Удалить»
//        if editingStyle == .delete {
//            // Удаляем город из массива
//            friends.remove(at: indexPath.row)
//            // И удаляем строку из таблицы
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        }
//    }
}





