//
//  VkGraffiti.swift
//  Aggregator
//
//  Created by Сергей Петров on 08.03.2021.
//

import Foundation

struct VkGraffiti: Codable {
    let src: String
    let width: Int
    let height: Int
    
    let id: Int?
    let owner_id: Int?
    let photo_130: String?
    let photo_604: String?
}
