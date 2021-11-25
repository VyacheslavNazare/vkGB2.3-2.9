//
//  GroupsDB.swift
//  UI_app
//
//  Created by Вячеслав on 14.11.2021.
//

import Foundation
import RealmSwift

final class GroupsDB {

    init() {
        Realm.Configuration.defaultConfiguration = Realm.Configuration(schemaVersion: 1)
    }

    func save(_ items: [GroupModel])  {
        let realm = try! Realm()

        try! realm.write {
            realm.add(items)
        }
    }
    func load() -> Results<GroupModel> {
        let realm = try! Realm()
        let friends: Results<GroupModel> = realm.objects(GroupModel.self)
        return friends
    }
    func delete(_ item: [GroupModel]) {
        let realm = try! Realm()
        try! realm.write{
            realm.delete(item)
        }
    }
}
