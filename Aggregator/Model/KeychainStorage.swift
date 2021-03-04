//
//  KeychainStorage.swift
//  Aggregator
//
//  Created by Сергей Петров on 03.03.2021.
//

import Foundation
import CryptoKit
import VK_ios_sdk

public class KeychainStorage {
    
    static var shared = KeychainStorage()
    let vkTokenTag = "com.aggregator.keys.vktoken".data(using: .utf8)!
    
    private init() {
        
    }
    
    public func getVKAccessToken() -> SecKey? {
        let getquery: [String: Any] = [kSecClass as String: kSecClassKey,
                                       kSecAttrApplicationTag as String: vkTokenTag,
                                       kSecAttrKeyType as String: kSecAttrKeyTypeRSA,
                                       kSecReturnRef as String: true
        ]
        var item: CFTypeRef?
        let status = SecItemCopyMatching(getquery as CFDictionary, &item)
        guard status == errSecSuccess else {
            print("Error! can't getVKAccessToken")
            return nil
        }
        return Optional(item as! SecKey)
    }
    
    public func setVKAccessToken(_ token: VKAccessToken) -> Bool {
        let addTokenQuery: [String: Any] = [kSecClass as String: kSecClassKey,
                                            kSecAttrApplicationTag as String: vkTokenTag,
                                            kSecValueRef as String: token
        ]
        let status = SecItemAdd(addTokenQuery as CFDictionary, nil)
        guard status == errSecSuccess else {
            print("Error! can't setVKAccessToken")
            return false
        }
        return true
    }
}
