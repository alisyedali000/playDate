//
//  BlogEndPoints.swift
//  PlayDate
//
//  Created by Aadil on 22/05/2023.
//

import Foundation
enum BlogEndPoints {
    case blog(category_name: String)
    case saveblog(blog_id: String)
    case savedBlog
}
extension BlogEndPoints: Endpoint {
    var path: String {
        switch self {
        case .blog:
            return "\(AppUrl.APIPATCH)/blog/search"
        case .saveblog:
            return "\(AppUrl.APIPATCH)/blog/saved"
        case .savedBlog:
            return "\(AppUrl.APIPATCH)/user/saved_blogs"
        }
    }
    
    var method: RequestMethod {
        switch self{
        case .blog:
            return .post
        case .saveblog:
            return .post
        case .savedBlog:
            return .post
        }
    }
    
    var body: [String : Any?]? {
        switch self {
        case .blog(let category_name):
            let params = ["category_name": category_name]
            return params
            
        case .saveblog(let blog_id):
            let user_id = UserDefaultManager.shared.userId
            let params = ["user_id": "\(user_id)",
                          "blog_id": blog_id] as [String : Any]
            return params
            
        case .savedBlog:
            let user_id = UserDefaultManager.shared.userId
            let params = ["user_id":"\(user_id)"]
            
            return params
        }
    }
    
    
}
