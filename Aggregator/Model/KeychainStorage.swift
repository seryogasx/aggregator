//
//  KeychainStorage.swift
//  Aggregator
//
//  Created by Сергей Петров on 03.03.2021.
//

import Foundation
//import CryptoKit
import Security
import VK_ios_sdk

public class KeychainStorage {
    
    enum KeychainError: Error {
        case addKeyError(String)
        case getKeyError(String)
        case dataError(String)
        case existsError(String)
        case updateError(String)
        case deleteError(String)
    }
    
//    static var shared = KeychainStorage()
    private static let service = "AggregatorService"
    
    private init() {
        
    }
    
    static func exists(_ key: String) throws -> Bool {
        let status = SecItemCopyMatching([
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key,
            kSecAttrService: service,
            kSecReturnData: false,
            ] as NSDictionary, nil)
        if status == errSecSuccess {
            return true
        } else if status == errSecItemNotFound {
            return false
        } else {
            throw KeychainError.existsError("Somethig goes wrong by exists check!")
        }
    }
    
    static func set(value: Data, forKey key: String) throws {
        if try exists(key) {
            try update(value: value, forKey: key)
        } else {
            try add(value: value, forKey: key)
        }
    }
    
    private static func add(value: Data, forKey key: String) throws {
        let status = SecItemAdd([
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key,
            kSecAttrService: service,
            // Allow background access:
            kSecAttrAccessible: kSecAttrAccessibleAfterFirstUnlock,
            kSecValueData: value,
            ] as NSDictionary, nil)
        guard status == errSecSuccess else { throw KeychainError.addKeyError("Error to add value, status != errSecSuccess!") }
    }
    
    private static func update(value: Data, forKey key: String) throws {
        let status = SecItemUpdate([
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key,
            kSecAttrService: service,
            ] as NSDictionary, [
            kSecValueData: value,
            ] as NSDictionary)
        guard status == errSecSuccess else { throw KeychainError.updateError("Error to update value, status != errSecSuccess!") }
    }
    
    static func delete(_ key: String) throws {
        let status = SecItemDelete([
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key,
            kSecAttrService: service,
            ] as NSDictionary)
        guard status == errSecSuccess else { throw KeychainError.deleteError("Error to delete value, status != errSecSuccess!") }
    }
    
    static func get(_ key: String) throws -> Data? {
        var result: AnyObject?
        let status = SecItemCopyMatching([
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: key,
            kSecAttrService: service,
            kSecReturnData: true,
            ] as NSDictionary, &result)
        if status == errSecSuccess {
            return result as? Data
        } else if status == errSecItemNotFound {
            return nil
        } else {
            throw KeychainError.getKeyError("Error to get value!")
        }
    }
    
    static func deleteAll() throws {
        let status = SecItemDelete([
            kSecClass: kSecClassGenericPassword,
            ] as NSDictionary)
        guard status == errSecSuccess else { throw KeychainError.dataError("Error to deleteAll values, status != errSecSuccess!") }
    }
}
