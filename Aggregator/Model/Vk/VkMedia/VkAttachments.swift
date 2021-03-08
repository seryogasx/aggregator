//
//  Attachments.swift
//  Aggregator
//
//  Created by Сергей Петров on 08.03.2021.
//

import Foundation

protocol VkAttachment: Codable {
    var type: String { get }
}

struct VkPhotoAttachment: Codable, VkAttachment {
    var type = "photo"
    let photo: VkPhoto
}

struct VkPostedPhotoAttachment: Codable, VkAttachment { // 2013 or early
    var type = "posted_photo"
    let posted_photo: VkPostedPhoto
}

struct VkPostedPhoto: Codable {
    let id: Int
    let owner_id: Int
    let photo_130: String
    let photo_604: String
}

struct VkVideoAttachment: Codable, VkAttachment {
    var type = "video"
    let video: VkVideo
}

struct VkAudioAttachment: Codable, VkAttachment {
    var type = "audio"
    let audio: VkAudio
}

struct VkDocAttachment: Codable, VkAttachment {
    var type = "doc"
    let doc: VkDoc
}

struct VkGraffitiAttachment: Codable, VkAttachment { // 2013 or early
    var type = "graffiti"
    let graffiti: VkGraffiti?
    let photo: VkPhoto?
    let id: Int?
    let owner_id: Int?
    let photo_130: String?
    let photo_604: String?
}

struct VkLinkAttachment: Codable, VkAttachment { // 2013 or early
    var type = "graffiti"
    let link: VkLink
}

struct VkNoteAttachment: Codable, VkAttachment {
    var type = "note"
    let note: VkNote
}

struct VkAppAttachment: Codable, VkAttachment {
    var type = "app"
    var app: VkApp
}

struct VkPollAttachment: Codable, VkAttachment {
    var type = "poll"
    let poll: VkPoll
}

struct VkPageAttachment: Codable, VkAttachment {
    var type = "page"
    let page: VkPage?
    let id: Int?
    let group_id: Int?
    let title: String?
}

struct VkAlbumAttachment: Codable, VkAttachment {
    var type = "album"
    var album: VkAlbum
}

struct VkPhotosListAttachment: Codable, VkAttachment {
    var type = "photos_list"
    let photos_list: [String]
}

struct VkMarketAttachment: Codable, VkAttachment {
    var type = "market"
    let market: VkMarket
}

struct VkMarketAlbumAttachment: Codable, VkAttachment {
    var type = "market_album"
    let market_album: VkMarketAlbum
}

struct VkStickerAttachment: Codable, VkAttachment {
    var type = "sticker"
    let sticker: VkMarketAlbum
}

struct VkPrettyCardsAttachment: Codable, VkAttachment {
    var type = "pretty_cards"
    let pretty_cards: VkPrettyCards
}
