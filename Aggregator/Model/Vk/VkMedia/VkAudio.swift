//
//  VkAudio.swift
//  Aggregator
//
//  Created by Сергей Петров on 08.03.2021.
//

import Foundation

struct VkAudio: Codable {
    let id: Int
    let owner_id: Int
    let artist: String
    let title: String
    let duration: Int
    let url: String
    let lyrics_id: Int
    let album_id: Int
    let genre_id: Int
    let date: Int
    let no_search: Int
    let is_hq: Int
}

struct VkAudioMessage: Codable {
    let duration: Int
    let waveform: [Int]
    let ling_ogg: String?
    let link_mp3: String?
}
