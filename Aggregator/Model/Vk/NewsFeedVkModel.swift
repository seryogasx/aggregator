import Foundation

struct Photo: Codable {
    var id: Int?
    var owner_id: Int?
    var album_id: Int?
    var src: URL?
    var src_big: URL?
}

struct Photo_Tag: Codable {
    var id: Int?
    var owner_id: Int?
    var album_id: Int?
    var src: URL?
    var src_big: URL?
}

struct Note: Codable {
    var id: Int?
    var owner_id: Int?
    var title: String?
    var comments: Int?
}

struct Profile: Codable {
    var first_name: String?
    var id: Int?
    var last_name: String?
    var can_access_closed: Bool?
    var is_closed: Bool?
    var sex: Int?
    var screen_name: Int?
    var photo_50: URL?
    var photo_100: URL?
    var online: Int?
}

struct Group: Codable {
    var id: Int?
    var name: String?
    var screen_name: String?
    var is_closed: Int?
    var type: String?
    var is_admin: Int?
    var is_member: Int?
    var is_advertiser: Int?
    var photo_50: URL?
    var photo_100: URL?
    var photo_200: URL?
}

struct Comment: Codable {
    var count: Int?
    var can_post: Int?
}

struct Like: Codable {
    var count: Int?
    var user_likes: Int?
    var can_like: Int?
    var can_publish: Int?
}

struct Repost: Codable {
    var count: Int?
    var user_reposted: Int?
}

// Need to add atachment!

//protocol Attachment: Codable {
//    var type: String { get set }
//}
//
//struct Photo: Attachment {
//    var photo:
//}

struct VkItem: Codable {
    var type: String?
    var source_id: Int?
    var date: Date?
    var post_id: Int?
    var post_type: String?
    var final_post: String?
    var copy_owner_id: Int?
    var copy_post_id: String?
    var copy_history: String?
    var copy_post_date: String?
    var text: String?
    var can_edit: String?
    var can_delete: String?
    var comments: Comment?
    var likes: Like?
    var reposts: Repost?
//    var attachments: [Attachment]?
    var geo: Int?
    var photos: Photo?
    var photo_tags: Photo_Tag?
    var notes: Note?
    var friends: Int?
}

class VkNewsFeed: Codable {
    var items: [VkItem]
    var profiles: [Profile]?
    var groups: [Group]?
    var new_offset: String?
    var next_from: String?
}
