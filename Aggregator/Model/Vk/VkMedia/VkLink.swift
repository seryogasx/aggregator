//
//  VkLink.swift
//  Aggregator
//
//  Created by Сергей Петров on 08.03.2021.
//

import Foundation

struct VkLink: Codable {
    let url: String
    let title: String
    let caption: String?
    let description: String
    let photo: VkPhoto?
    let product: VkProduct?
    let button: VkButton?
    let preview_page: String
    let preview_url: String
}

struct VkProduct: Codable {
    let price: VkPrice
}

struct VkButton: Codable {
    let title: String
    let action: VkButtonAction
}

struct VkButtonAction: Codable {
    let type: String
    let url: String
}
