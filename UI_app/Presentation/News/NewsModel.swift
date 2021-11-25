//
//  NewsModel.swift
//  UI_app
//
//  Created by Вячеслав on 06.11.2021.
//

import Foundation
import RealmSwift


// MARK: - Group
class NewsDB: Object, Codable {
    @objc dynamic var id: Int
    dynamic var photo100, photo50, photo200: URL
    @objc dynamic var type, screenName, name: String
    @objc dynamic var isClosed: Int

    enum CodingKeys: String, CodingKey {
        case id
        case photo100 = "photo_100"
        case photo50 = "photo_50"
        case photo200 = "photo_200"
        case type
        case screenName = "screen_name"
        case name
        case isClosed = "is_closed"
    }
}






//// MARK: - Response
//class NewsDB: Codable {
//    let items: [Item1]
//    let groups: [Group1]
//    let profiles: [Profile]
//    let nextFrom: String
//
//    enum CodingKeys: String, CodingKey {
//        case items, groups, profiles
//        case nextFrom = "next_from"
//    }
//
//    init(items: [Item1], groups: [Group1], profiles: [Profile], nextFrom: String) {
//        self.items = items
//        self.groups = groups
//        self.profiles = profiles
//        self.nextFrom = nextFrom
//    }
//}
//
//// MARK: - Group
//class Group1: Codable {
//    let id: Int
//    let photo100, photo50, photo200: String
//    let type, screenName, name: String
//    let isClosed: Int
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case photo100 = "photo_100"
//        case photo50 = "photo_50"
//        case photo200 = "photo_200"
//        case type
//        case screenName = "screen_name"
//        case name
//        case isClosed = "is_closed"
//    }
//
//    init(id: Int, photo100: String, photo50: String, photo200: String, type: String, screenName: String, name: String, isClosed: Int) {
//        self.id = id
//        self.photo100 = photo100
//        self.photo50 = photo50
//        self.photo200 = photo200
//        self.type = type
//        self.screenName = screenName
//        self.name = name
//        self.isClosed = isClosed
//    }
//}
//
//// MARK: - Item
//class Item1: Codable {
//    let comments: Comments
//    let canSetCategory: Bool
//    let likes: Likes
//    let reposts: Reposts
//    let type, postType: PostTypeEnum
//    let date, sourceID: Int
//    let text: String
//    let canDoubtCategory: Bool
//    let attachments: [Attachment]
//    let markedAsAds, postID: Int
//    let postSource: PostSource
//    let views: Views
//    let signerID: Int?
//    let categoryAction: CategoryAction?
//
//    enum CodingKeys: String, CodingKey {
//        case comments
//        case canSetCategory = "can_set_category"
//        case likes, reposts, type
//        case postType = "post_type"
//        case date
//        case sourceID = "source_id"
//        case text
//        case canDoubtCategory = "can_doubt_category"
//        case attachments
//        case markedAsAds = "marked_as_ads"
//        case postID = "post_id"
//        case postSource = "post_source"
//        case views
//        case signerID = "signer_id"
//        case categoryAction = "category_action"
//    }
//
//    init(comments: Comments, canSetCategory: Bool, likes: Likes, reposts: Reposts, type: PostTypeEnum, postType: PostTypeEnum, date: Int, sourceID: Int, text: String, canDoubtCategory: Bool, attachments: [Attachment], markedAsAds: Int, postID: Int, postSource: PostSource, views: Views, signerID: Int?, categoryAction: CategoryAction?) {
//        self.comments = comments
//        self.canSetCategory = canSetCategory
//        self.likes = likes
//        self.reposts = reposts
//        self.type = type
//        self.postType = postType
//        self.date = date
//        self.sourceID = sourceID
//        self.text = text
//        self.canDoubtCategory = canDoubtCategory
//        self.attachments = attachments
//        self.markedAsAds = markedAsAds
//        self.postID = postID
//        self.postSource = postSource
//        self.views = views
//        self.signerID = signerID
//        self.categoryAction = categoryAction
//    }
//}
//
//// MARK: - Attachment
//class Attachment: Codable {
//    let type: AttachmentType
//    let video: Video?
//    let photo: Photo1?
//    let audio: Audio?
//
//    init(type: AttachmentType, video: Video?, photo: Photo1?, audio: Audio?) {
//        self.type = type
//        self.video = video
//        self.photo = photo
//        self.audio = audio
//    }
//}
//
//// MARK: - Audio
//class Audio: Codable {
//    let id: Int
//    let storiesCoverAllowed: Bool
//    let url: String
//    let title: String
//    let ownerID, date: Int
//    let isHq: Bool
//    let genreID: Int?
//    let shortVideosAllowed: Bool
//    let duration: Int
//    let artist: String
//    let albumID: Int
//    let storiesAllowed: Bool
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case storiesCoverAllowed = "stories_cover_allowed"
//        case url, title
//        case ownerID = "owner_id"
//        case date
//        case isHq = "is_hq"
//        case genreID = "genre_id"
//        case shortVideosAllowed = "short_videos_allowed"
//        case duration, artist
//        case albumID = "album_id"
//        case storiesAllowed = "stories_allowed"
//    }
//
//    init(id: Int, storiesCoverAllowed: Bool, url: String, title: String, ownerID: Int, date: Int, isHq: Bool, genreID: Int?, shortVideosAllowed: Bool, duration: Int, artist: String, albumID: Int, storiesAllowed: Bool) {
//        self.id = id
//        self.storiesCoverAllowed = storiesCoverAllowed
//        self.url = url
//        self.title = title
//        self.ownerID = ownerID
//        self.date = date
//        self.isHq = isHq
//        self.genreID = genreID
//        self.shortVideosAllowed = shortVideosAllowed
//        self.duration = duration
//        self.artist = artist
//        self.albumID = albumID
//        self.storiesAllowed = storiesAllowed
//    }
//}
//
//// MARK: - Photo
//class Photo1: Codable {
//    let albumID, id, date: Int
//    let text: String
//    let userID: Int
//    let sizes: [Size]
//    let hasTags: Bool
//    let ownerID: Int
//    let accessKey: String
//    let postID: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case albumID = "album_id"
//        case id, date, text
//        case userID = "user_id"
//        case sizes
//        case hasTags = "has_tags"
//        case ownerID = "owner_id"
//        case accessKey = "access_key"
//        case postID = "post_id"
//    }
//
//    init(albumID: Int, id: Int, date: Int, text: String, userID: Int, sizes: [Size], hasTags: Bool, ownerID: Int, accessKey: String, postID: Int?) {
//        self.albumID = albumID
//        self.id = id
//        self.date = date
//        self.text = text
//        self.userID = userID
//        self.sizes = sizes
//        self.hasTags = hasTags
//        self.ownerID = ownerID
//        self.accessKey = accessKey
//        self.postID = postID
//    }
//}
//
//// MARK: - Size
//class Size1: Codable {
//    let width, height: Int
//    let url: String
//    let type: SizeType
//
//    init(width: Int, height: Int, url: String, type: SizeType) {
//        self.width = width
//        self.height = height
//        self.url = url
//        self.type = type
//    }
//}
//
//enum SizeType: String, Codable {
//    case m = "m"
//    case o = "o"
//    case p = "p"
//    case q = "q"
//    case r = "r"
//    case s = "s"
//    case w = "w"
//    case x = "x"
//    case y = "y"
//    case z = "z"
//}
//
//enum AttachmentType: String, Codable {
//    case audio = "audio"
//    case photo = "photo"
//    case video = "video"
//}
//
//// MARK: - Video
//class Video: Codable {
//    let firstFrame800: String
//    let ownerID, canAdd, duration: Int
//    let photo320, photo1280, firstFrame1280: String
//    let title: String
//    let views, canLike, canComment: Int
//    let firstFrame130: String
//    let date: Int
//    let firstFrame160: String
//    let id, height: Int
//    let trackCode: String
//    let width, canAddToFaves: Int
//    let accessKey: String
//    let comments: Int
//    let photo800, photo130: String
//    let canSubscribe: Int
//    let firstFrame320: String
//    let canRepost: Int
//    let videoDescription: String
//    let videoRepeat: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case firstFrame800 = "first_frame_800"
//        case ownerID = "owner_id"
//        case canAdd = "can_add"
//        case duration
//        case photo320 = "photo_320"
//        case photo1280 = "photo_1280"
//        case firstFrame1280 = "first_frame_1280"
//        case title, views
//        case canLike = "can_like"
//        case canComment = "can_comment"
//        case firstFrame130 = "first_frame_130"
//        case date
//        case firstFrame160 = "first_frame_160"
//        case id, height
//        case trackCode = "track_code"
//        case width
//        case canAddToFaves = "can_add_to_faves"
//        case accessKey = "access_key"
//        case comments
//        case photo800 = "photo_800"
//        case photo130 = "photo_130"
//        case canSubscribe = "can_subscribe"
//        case firstFrame320 = "first_frame_320"
//        case canRepost = "can_repost"
//        case videoDescription = "description"
//        case videoRepeat = "repeat"
//    }
//
//    init(firstFrame800: String, ownerID: Int, canAdd: Int, duration: Int, photo320: String, photo1280: String, firstFrame1280: String, title: String, views: Int, canLike: Int, canComment: Int, firstFrame130: String, date: Int, firstFrame160: String, id: Int, height: Int, trackCode: String, width: Int, canAddToFaves: Int, accessKey: String, comments: Int, photo800: String, photo130: String, canSubscribe: Int, firstFrame320: String, canRepost: Int, videoDescription: String, videoRepeat: Int?) {
//        self.firstFrame800 = firstFrame800
//        self.ownerID = ownerID
//        self.canAdd = canAdd
//        self.duration = duration
//        self.photo320 = photo320
//        self.photo1280 = photo1280
//        self.firstFrame1280 = firstFrame1280
//        self.title = title
//        self.views = views
//        self.canLike = canLike
//        self.canComment = canComment
//        self.firstFrame130 = firstFrame130
//        self.date = date
//        self.firstFrame160 = firstFrame160
//        self.id = id
//        self.height = height
//        self.trackCode = trackCode
//        self.width = width
//        self.canAddToFaves = canAddToFaves
//        self.accessKey = accessKey
//        self.comments = comments
//        self.photo800 = photo800
//        self.photo130 = photo130
//        self.canSubscribe = canSubscribe
//        self.firstFrame320 = firstFrame320
//        self.canRepost = canRepost
//        self.videoDescription = videoDescription
//        self.videoRepeat = videoRepeat
//    }
//}
//
//// MARK: - CategoryAction
//class CategoryAction: Codable {
//    let name: String
//    let action: Action
//
//    init(name: String, action: Action) {
//        self.name = name
//        self.action = action
//    }
//}
//
//// MARK: - Action
//class Action: Codable {
//    let target, type, url: String
//
//    init(target: String, type: String, url: String) {
//        self.target = target
//        self.type = type
//        self.url = url
//    }
//}
//
//// MARK: - Comments
//class Comments: Codable {
//    let count, canPost: Int
//    let groupsCanPost: Bool?
//
//    enum CodingKeys: String, CodingKey {
//        case count
//        case canPost = "can_post"
//        case groupsCanPost = "groups_can_post"
//    }
//
//    init(count: Int, canPost: Int, groupsCanPost: Bool?) {
//        self.count = count
//        self.canPost = canPost
//        self.groupsCanPost = groupsCanPost
//    }
//}
//
//// MARK: - Likes
//class Likes1: Codable {
//    let canLike, canPublish, count, userLikes: Int
//
//    enum CodingKeys: String, CodingKey {
//        case canLike = "can_like"
//        case canPublish = "can_publish"
//        case count
//        case userLikes = "user_likes"
//    }
//
//    init(canLike: Int, canPublish: Int, count: Int, userLikes: Int) {
//        self.canLike = canLike
//        self.canPublish = canPublish
//        self.count = count
//        self.userLikes = userLikes
//    }
//}
//
//// MARK: - PostSource
//class PostSource: Codable {
//    let type: PostSourceType
//
//    init(type: PostSourceType) {
//        self.type = type
//    }
//}
//
//enum PostSourceType: String, Codable {
//    case api = "api"
//    case vk = "vk"
//}
//
//enum PostTypeEnum: String, Codable {
//    case post = "post"
//}
//
//// MARK: - Reposts
//class Reposts1: Codable {
//    let count, userReposted: Int
//
//    enum CodingKeys: String, CodingKey {
//        case count
//        case userReposted = "user_reposted"
//    }
//
//    init(count: Int, userReposted: Int) {
//        self.count = count
//        self.userReposted = userReposted
//    }
//}
//
//// MARK: - Views
//class Views: Codable {
//    let count: Int
//
//    init(count: Int) {
//        self.count = count
//    }
//}
//
//// MARK: - Profile
//class Profile: Codable {
//    let online, id: Int
//    let photo100: String
//    let lastName: String
//    let photo50: String
//    let onlineInfo: OnlineInfo
//    let sex: Int
//    let screenName, firstName: String
//
//    enum CodingKeys: String, CodingKey {
//        case online, id
//        case photo100 = "photo_100"
//        case lastName = "last_name"
//        case photo50 = "photo_50"
//        case onlineInfo = "online_info"
//        case sex
//        case screenName = "screen_name"
//        case firstName = "first_name"
//    }
//
//    init(online: Int, id: Int, photo100: String, lastName: String, photo50: String, onlineInfo: OnlineInfo, sex: Int, screenName: String, firstName: String) {
//        self.online = online
//        self.id = id
//        self.photo100 = photo100
//        self.lastName = lastName
//        self.photo50 = photo50
//        self.onlineInfo = onlineInfo
//        self.sex = sex
//        self.screenName = screenName
//        self.firstName = firstName
//    }
//}
//
//// MARK: - OnlineInfo
//class OnlineInfo: Codable {
//    let visible, isMobile, isOnline: Bool
//    let lastSeen: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case visible
//        case isMobile = "is_mobile"
//        case isOnline = "is_online"
//        case lastSeen = "last_seen"
//    }
//
//    init(visible: Bool, isMobile: Bool, isOnline: Bool, lastSeen: Int?) {
//        self.visible = visible
//        self.isMobile = isMobile
//        self.isOnline = isOnline
//        self.lastSeen = lastSeen
//    }
//}
//
