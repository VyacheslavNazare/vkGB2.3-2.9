//
//  GroupViewController.swift
//  UI_app
//
//  Created by Вячеслав on 18.08.2021.
//

import UIKit
import RealmSwift

class GroupViewController: UIViewController {

    private let groupsAPI = GroupsAPI()
    private let groupsDB = GroupsDB()
    private var groups: Results<GroupModel>?
    private var token: NotificationToken?
    
//    var groups: [GroupModel] = []
    
    @IBOutlet weak var tableView: UITableView!



    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        groupsAPI.getGroups { [weak self] groups in
            guard let self = self else { return }
            self.groupsDB.save(groups)
            self.groups = self.groupsDB.load()
            self.token = self.groups?.observe { [weak self] changes in
                self?.tableView.reloadData()
            }
        }
    }
    
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "moveToGalleryGroup" {
//         
//            guard
//                let destinationVC = segue.destination as? GalleryGroupViewController,
//                let indexSelectCell = tableView.indexPathForSelectedRow?.row
//            else { return }
//            
//            let selectGroup = groups[indexSelectCell]
//            destinationVC.title = selectGroup.name
////            destinationVC.galleryGroups = selectGroup.galleryGroup
//        }
//    }

//    @IBAction func addGroup(_ segeu: UIStoryboardSegue) {
//        guard
//            let sourceController = segeu.source as? AllGroupViewController,
//            let indexSelectCell = sourceController.tableView.indexPathForSelectedRow
//        else { return }
//        let group = sourceController.sortedGroups[indexSelectCell.section][indexSelectCell.row]
//        if !groups.contains(where: { group.nameG == $0.nameG }) {
//            groups.append(group)
//        }
//
//        tableView.reloadData()
//    }
//
}

extension GroupViewController: UITableViewDelegate, UITableViewDataSource {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let groups = groups else { return 0 }
        return groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GroupTableViewCell.identifier) as! GroupTableViewCell
        
        cell.configure(group: groups?[indexPath.row] as! GroupModel)
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, commit editiStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editiStyle == .delete {
//            groups.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        }
//    }
    
    
}

