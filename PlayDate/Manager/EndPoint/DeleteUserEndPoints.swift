//
//  DeleteUserEndPoints.swift
//  PlayDate
//
//  Created by Aadil on 06/06/2023.
//

import Foundation
enum DeleteUserEndPoints{
    case deleteUser
}
extension DeleteUserEndPoints: Endpoint {
    var path: String {
        switch self {
        case .deleteUser:
            return "\(AppUrl.APIPATCH)/user/delete"
        }
    }
    
    var method: RequestMethod {
        switch self {
            
        case .deleteUser:
            return .post
        }
    }
    
    var body: [String : Any?]? {
        switch self {
            
        case .deleteUser:
            let userID = UserDefaultManager.shared.userId
            
            let params = ["user_id": "\(userID)"] 
            return params
        }
    }
    
    
}
