//
//  VkEvent.swift
//  Aggregator
//
//  Created by Сергей Петров on 08.03.2021.
//

import Foundation

struct VkEvent: Codable {
    let id: Int
    let time: Int
    let member_status: Int
    let is_favorite: Bool
    let adress: String
    let text: String
    let button_text: String
    let friends: [Int]
}
