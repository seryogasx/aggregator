//
//  VkMarket.swift
//  Aggregator
//
//  Created by Сергей Петров on 08.03.2021.
//

import Foundation

struct VkMarket: Codable {
    let id: Int
    let owner_id: Int
    let title: String
    let description: String
    let price: VkPrice
    let dimensions: VkMarketDimensions
    let width: Int
    let category: VkMarketCategory
    let thumb_photo: String
    let date: Int
    let availability: Int
    let is_favorite: Bool
    let sku: String
    
    let extended: Int?
    let photos: [VkPhoto]
    let can_comment: Int?
    let can_repost: Int?
    let likes: Like?
    let url: String?
    let button_title: String?
}

struct VkMarketDimensions: Codable {
    let width: Int
    let height: Int
    let length: Int
}

struct VkMarketCategory: Codable {
    let id: Int
    let name: String
    let section: VkMarketCategorySection
}

struct VkMarketCategorySection: Codable {
    let id: Int
    let name: String
}
