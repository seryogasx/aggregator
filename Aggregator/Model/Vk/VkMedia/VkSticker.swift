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
    let images: [VkCompactPhoto]
    let images_with_background: [VkCompactPhoto]
    let animation_url: String
    let is_allowed: Bool
}
