//
//  VkSticker.swift
//  Aggregator
//
//  Created by Сергей Петров on 08.03.2021.
//

import Foundation

struct VkSticker: Codable {
    let product_id: Int
    let sticker_id: Int
    let images: [VkStickerPhoto]
    let images_with_background: [VkStickerPhoto]
    let animation_url: String
    let is_allowed: Bool
}
