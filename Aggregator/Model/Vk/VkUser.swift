//
//  VkUser.swift
//  Aggregator
//
//  Created by Сергей Петров on 08.03.2021.
//

import Foundation

struct VkUser: Codable {
    let id: Int
    let first_name: String
    let last_name: String
    let deactivated: String
    let is_closed: Bool
    let can_access_closed: Bool
    
    let about: String?
    let activities: String?
    let bdate: String?
    let blacklisted: Int?
    let blacklisted_by_me: Int?
    let books: String?
    let can_post: Int?
    let can_see_all_posts: Int?
    let can_see_audio: Int?
    let can_send_friend_request: Int?
    let can_write_private_message: Int?
    let career: VkCareer?
    let city: VkCity?
    let common_count: Int?
    let connections: [String: String]?
    let contacts: VkContact?
    let counters: VkCounter?
    let coutry: VkCountry?
    let crop_photo: VkCropPhoto?
    let domain: String?
    let education: VkEducation?
    let exports: String?
    let first_name_non: String?
    let first_name_gen: String?
    let first_name_dat: String?
    let first_name_acc: String?
    let first_name_ins: String?
    let first_name_abl: String?
    let followers_count: Int?
    let friend_status: Int?
    let games: String?
    let has_mobile: Int?
    let has_photo: Int?
    let home_town: String?
    let interests: String?
    let is_favorite: Int?
    let is_friend: Int?
    let is_hidden_from_feed: Int?
    let last_name_non: String?
    let last_name_gen: String?
    let last_name_dat: String?
    let last_name_acc: String?
    let last_name_ins: String?
    let last_name_abl: String?
    let last_seen: VkLastSeen?
    let lists: String?
    let maiden_name: String?
    let military: VkMilitary?
    let movies: String?
    let music: String?
    let nickname: String?
    let occupation: VkOccupation?
    let online: Int?
    let personal: VkPersonal?
    let photo_50: String?
    let photo_100: String?
    let photo_200_orig: String?
    let photo_200: String?
    let photo_400_orig: String?
    let photo_id: String?
    let photo_max: String?
    let photo_max_orig: String?
    let quotes: String?
    let relatives: VkRelative?
    let relation: Int?
    let schools: VkSchool?
    let screen_name: String?
    let sex: Int?
    let site: String?
    let status: String
    let status_audio: VkAudio?
    let timezone: Int?
    let trending: Int?
    let tv: String?
    let universities: [VkUniversity]?
    let verified: Int?
    let wall_default: String?
}

struct VkCareer: Codable {
    let group_id: Int?
    let company: String?
    let country_id: Int
    let city_id: Int?
    let city_name: String?
    let from: Int
    let until: Int
    let position: String
}

struct VkCity: Codable {
    let id: Int?
    let title: String
}

struct VkContact: Codable {
    let mobile_phone: String?
    let home_phone: String?
}

struct VkCounter: Codable {
    let albums: Int
    let videos: Int
    let audios: Int
    let photos: Int
    let notes: Int
    let friends: Int
    let groups: Int
    let online_friends: Int
    let mutual_friends: Int
    let user_videos: Int
    let followers: Int
    let pages: Int
}

struct VkCountry: Codable {
    let id: Int?
    let title: String
}

struct VkEducation: Codable {
    let university: Int
    let university_name: String
    let faculty: Int
    let faculty_name: String
    let graduation: Int
}

struct VkLastSeen: Codable {
    let time: Int
    let platform: Int
}



struct VkMilitary: Codable {
    let unit: String
    let unit_id: Int
    let country_id: Int
    let from: Int
    let until: Int
}

struct VkOccupation: Codable {
    let type: String
    let id: Int
    let name: String
}

struct VkPersonal: Codable {
    let political: Int
    let langs: [String]
    let religion: String
    let inspired_by: String
    let people_main: Int
    let life_main: Int
    let smoking: Int
    let alcohol: Int
}

struct VkRelative: Codable {
    let id: Int
    let name: String
    let type: String
}

struct VkSchool: Codable {
    let id: Int
    let country: Int
    let city: Int
    let name: String
    let year_from: Int
    let year_to: Int
    let year_graduated: Int
    let `class`: String
    let speciality: String
    let type: Int?
    let type_str: String?
}

struct VkUniversity: Codable {
    let id: Int
    let country: Int
    let city: Int
    let name: String
    let faculty: Int
    let faculty_name: String
    let chair: Int
    let chair_name: String
    let graduation: Int
    let education_form: String
    let education_status: String
}
