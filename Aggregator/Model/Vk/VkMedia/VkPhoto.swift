//
//  VkPhoto.swift
//  Aggregator
//
//  Created by Сергей Петров on 08.03.2021.
//

import Foundation

struct VkPhoto: Codable {
    let id: Int?
    let album_id: Int?
    let owner_id: Int?
    let user_id: Int?
    let text: String?
    let date: Int?
    let sizes: [VkImageSize]?
    let width: Int?
    let height: Int?
}

struct VkImageSize: Codable {
    let type: String
    let url: String
    let width: Int
    let height: Int
}

struct VkCropPhoto: Codable {
    let photo: VkPhoto
    let crop: VkCrop
    let rec: VkRec
}

struct VkCrop: Codable {
    let x: Int
    let y: Int
    let x2: Int
    let y2: Int
}

struct VkRec: Codable {
    let x: Int
    let y: Int
    let x2: Int
    let y2: Int
}

struct VkPhoto_Tag: Codable {
    var id: Int?
    var owner_id: Int?
    var album_id: Int?
    var src: URL?
    var src_big: URL?
}

struct VkPhotoSizes: Codable {
    let src: String
    let width: Int
    let height: Int
    let type: String
}
