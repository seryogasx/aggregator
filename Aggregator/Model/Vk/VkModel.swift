import Foundation
import VK_ios_sdk

struct VkRecord: Codable {
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

class VkRecordList {
    private var list: [VkRecord] = []
    
    public func append(_ newRecord: VkRecord) {
        self.list.append(newRecord)
    }
    
    subscript(_ index: Int) -> VkRecord {
        guard index < list.count else { fatalError("VkRecordList out of range!") }
        return list[index]
    }
}
