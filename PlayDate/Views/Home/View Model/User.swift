//
//  User.swift
//  PlayDate
//
//  Created by عادل🫥 on 01/05/2023.
//

import SwiftUI
//- User Model
struct UserModel: Codable, Identifiable {
    var id = UUID().uuidString
    var profilePic:String
    var name:String
    var getVaccinated:String
    var distance:String
    var cateogery:String
    var gender:String
    var age:String
    var x:CGFloat = 0.0
    var y:CGFloat = 0.0
    var degree:CGFloat = 0.0
}
struct userModel: Codable, Identifiable {
    var id: Int?
        var userID, name,gender, age: String?
        var interests: [String]?
        var colour, distance: String?
        var breed, image, vaccinated, deletedAt: String?
        var createdAt, updatedAt: String?
        var x:CGFloat = 0.0
        var y:CGFloat = 0.0
        var degree:CGFloat = 0.0
    enum CodingKeys: String, CodingKey {
        case id
                case userID = "user_id"
                case name, age, interests, colour, gender, breed, image, vaccinated
                case deletedAt = "deleted_at"
                case createdAt = "created_at"
                case updatedAt = "updated_at"
                case distance
        
        
    }
    
}
   


