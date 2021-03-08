//
//  VkPrice.swift
//  Aggregator
//
//  Created by Сергей Петров on 08.03.2021.
//

import Foundation

struct VkPrice: Codable {
    let amount: Int
    let currency: VkCurrency
    let old_amount: String?
    let text: String
}
