//
//  BlogsModel.swift
//  PlayDate
//
//  Created by Aadil on 22/05/2023.
//

import Foundation


struct BlogDetails : Codable, Identifiable {
    
    var id: Int?
    var title: String?
    var authorName: String?
    var authorImage: String?
    var likes: String?
    var saved: String?
    var share: String?
    var blogImage: String?
    var content: String?
    var categoryName: String?
    var createdAt: String?
    var updatedAt: String?
    
    enum CodingKeys: String, CodingKey {
        
        case id, title
        case authorName = "author_name"
        case authorImage = "author_image"
        case likes, saved, share
        case blogImage = "blog_image"
        case content
        case categoryName = "category_name"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

struct SavedBlogsModel: Codable, Identifiable {
    
    var id: Int
    var user_id: String
    var blog_id: BlogDetails
}
