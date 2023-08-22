//
//  HomeEndPoints.swift
//  PlayDate
//
//  Created by Aadil on 06/06/2023.
//

import Foundation
enum HomeEndPoints {
    case homeSwipeCard(age: String, breed: String, interests: [String])
    
   
}
extension HomeEndPoints: Endpoint{
    var path: String {
        switch self {
        case .homeSwipeCard:
            return "\(AppUrl.APIPATCH)/dashboard/dashboard"
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .homeSwipeCard:
            return .post
        }
    }
    
    var body: [String : Any?]? {
        switch self {
        case .homeSwipeCard(let age, let breed, let interests):
            let userID =  UserDefaultManager.shared.userId
            let params = ["user_id": "\(userID)",
                          "age": age,
                          "breed": breed,
                          "interests": interests] as [String: Any]
            return params
        }
    }
    
    
}
