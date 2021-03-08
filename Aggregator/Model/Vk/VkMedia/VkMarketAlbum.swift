//
//  VkMarketAlbum.swift
//  Aggregator
//
//  Created by Сергей Петров on 08.03.2021.
//

import Foundation

struct VkMarketAlbum: Codable {
    let id: Int
    let owner_id: Int
    let title: String
    let photo: VkPhoto
    let count: Int
    let updated_time: Int
}
