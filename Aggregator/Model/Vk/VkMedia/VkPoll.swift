//
//  VkPoll.swift
//  Aggregator
//
//  Created by Сергей Петров on 08.03.2021.
//

import Foundation

struct VkPoll: Codable {
    let id: Int
    let owner_id: Int
    let created: Int
    let question: String
    let votes: Int
    let answers: [VkAnswer]
    let anonymous: Bool
    let multiple: Bool
    let answer_ids: [Int]?
    let end_date: Int
    let closed: Bool
    let is_board: Bool
    let can_edit: Bool
    let can_vote: Bool
    let can_report: Bool
    let can_share: Bool
    let author_id: Int
    let photo: VkPhoto?
    let background: VkPollBackground?
    let friends: [Int]?
}

struct VkAnswer: Codable {
    let id: Int
    let text: String
    let votes: Int
    let rate: Int
}

struct VkPollBackground: Codable {
    let id: Int
    let type: String
    let angle: Int
    let color: String
    let width: Int
    let height: Int
    let images: [VkPhotoSizes]
    let points: [VkPollPoint]?
}

struct VkPollPoint: Codable {
    let position: Int
    let color: String
}
