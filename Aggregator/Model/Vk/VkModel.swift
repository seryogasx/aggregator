import Foundation
import VK_ios_sdk

struct Record: Codable {
    let author: String
    let publishedTime: Date
    let tag: String?
    let text: String
    let image: [Data]
    let likeCounter: Int
    let commentCounter: Int
    let repostCounter: Int
    let viewCounter: Int
}

struct RecordList {
    var list: [Record]
}
