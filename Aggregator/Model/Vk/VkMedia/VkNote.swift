//
//  VkNote.swift
//  Aggregator
//
//  Created by Сергей Петров on 08.03.2021.
//

import Foundation

struct VkNote: Codable {
    let id: Int
    let owner_id: Int
    let title: String
    let text: String
    let date: Int
    let comments: Int
    let read_comments: Int?
    let view_url: String
}
