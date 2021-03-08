//
//  VkCard.swift
//  Aggregator
//
//  Created by Сергей Петров on 08.03.2021.
//

import Foundation

struct VkPrettyCards: Codable {
    let cards: [VkCard]
}

struct VkCard: Codable {
    let card_id: String
    let link_url: String
    let title: String
    let images: [VkCompactPhoto]
    let button: VkButton
    let price: String
    let price_old: String
}
