//
//  VkAlbum.swift
//  Aggregator
//
//  Created by Сергей Петров on 08.03.2021.
//

import Foundation

struct VkAlbum: Codable {
    let id: Int
    let thumb: VkPhoto
    let owner_id: Int
    let title: String
    let description: String
    let created: Int
    let updated: Int
    let size: Int
}
