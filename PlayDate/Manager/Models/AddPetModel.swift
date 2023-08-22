//
//  AddPetModel.swift
//  PlayDate
//
//  Created by Aadil on 24/05/2023.
//

import Foundation

// MARK: - AddPetModel
struct AddPetModel: Codable, Identifiable {
    var id: Int?
    var userID, name, age: String?
    var interests: [String]?
    var colour: String?
    var gender: String?
    var breed: String?
    var image, vaccinated, deletedAt, createdAt: String?
    var updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case name, age, interests, colour, gender, breed, image, vaccinated
        case deletedAt = "deleted_at"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
