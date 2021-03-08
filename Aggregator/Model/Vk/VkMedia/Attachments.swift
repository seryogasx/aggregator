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
    let id: Int
    let owner_id: Int
    let photo_130: String
    let photo_604: String
}

struct VkLinkAttachment: Codable, VkAttachment { // 2013 or early
    var type = "graffiti"
    let link: VkLink
}



