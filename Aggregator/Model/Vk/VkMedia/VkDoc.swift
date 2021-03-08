//
//  VkDoc.swift
//  Aggregator
//
//  Created by Сергей Петров on 08.03.2021.
//

import Foundation

struct VkDoc: Codable {
    let id: Int
    let owner_id: Int
    let title: String
    let size: Int
    let ext: String
    let url: String
    let date: Int
    let type: Int
    let preview: VkDocPreview
}

struct VkDocPreview: Codable {
    let photo: VkPhoto?
    let graffiti: VkGraffiti?
    let audio_message: VkAudioMessage?
}
