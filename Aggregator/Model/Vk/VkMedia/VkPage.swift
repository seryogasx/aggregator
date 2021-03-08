//
//  VkPage.swift
//  Aggregator
//
//  Created by Сергей Петров on 08.03.2021.
//

import Foundation

struct VkPage: Codable {
    let id: Int
    let group_id: Int
    let creator_id: Int?
    let title: Int
    let current_user_can_edit: Int?
    let current_user_can_edit_access: Int?
    let who_can_edit: Int?
    let edited: Int?
    let created: Int?
    let editor_id: Int?
    let views: Int?
    let parent: String?
    let parent2: String?
    let source: String?
    let html: String?
    let view_url: String?
}
