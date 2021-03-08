//
//  VkVideo.swift
//  Aggregator
//
//  Created by Сергей Петров on 08.03.2021.
//

import Foundation

struct VkVideo: Codable {
    let id: Int
    let owner_id: Int
    let title: String
    let description: String
    let duration: Int
    let image: [VkVideoImage]
    let first_frame: VkVideoImage
    let date: Int
    let adding_date: Int
    let views: Int
    let local_views: Int
    let comments: Int
    let player: String
    let platform: String
    let can_add: Int
    let is_private: Int
    let access_key: String
    let processing: Int
    let is_favorite: Bool
    let can_comment: Int
    let can_edit: Int
    let can_like: Int
    let can_repost: Int
    let can_subscribe: Int
    let can_add_to_faves: Int
    let can_attach_link: Int
    let width: Int
    let height: Int
    let user_id: Int
    let converting: Int
    let added: Int
    let is_subscribed: Int
    let `repeat`: Int
    let type: String
    let live_status: String
    let live: Int
    let upcoming: Int
    let spectators: Int
    let likes: VkVideoLike
    let reposts: VkVideoRepost
}

struct VkVideoImage: Codable {
    let height: Int
    let url: String
    let width: String
    let with_padding: Int?
}

struct VkVideoLike: Codable {
    let count: Int
    let user_likes: Int
}

struct VkVideoRepost: Codable {
    let count: Int
    let wall_count: Int
    let mail_count: Int
    let user_reposted: Int
}
