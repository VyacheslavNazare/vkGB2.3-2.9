//
//  GroupSearchModel.swift
//  UI_app
//
//  Created by Вячеслав on 02.11.2021.
//

import Foundation
import RealmSwift

class GroupSearchDB: Object, Codable {
    @objc dynamic var id: Int
    @objc dynamic var photo100: String
    @objc dynamic var isAdvertiser, isAdmin: Int
    @objc dynamic var photo50, photo200: String
    @objc dynamic var type, screenName, name: String
    @objc dynamic var isClosed: Int

    enum CodingKeys: String, CodingKey {
//        case isMember = "is_member"
        case id
        case photo100 = "photo_100"
        case isAdvertiser = "is_advertiser"
        case isAdmin = "is_admin"
        case photo50 = "photo_50"
        case photo200 = "photo_200"
        case type
        case screenName = "screen_name"
        case name
        case isClosed = "is_closed"
    }
}

//isMember,
