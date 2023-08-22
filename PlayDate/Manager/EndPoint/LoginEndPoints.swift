//
//  LoginEndPoints.swift
//  PlayDate
//
//  Created by Aadil on 17/05/2023.
//

import Foundation

enum LoginEndPoints {
    
    case login(email: String, password: String)
}

extension LoginEndPoints : Endpoint {
    
    var path: String {
        switch self {
            
        case .login:
            return "\(AppUrl.APIPATCH)/auth/signin"
        }
    }
    
    var method: RequestMethod {
        switch self {
            
        case .login:
            return .post
        }
    }
    
    var body: [String : Any?]? {
        switch self {
            
        case .login(let email, let password):
            
            let params = ["email": email,
                          "password": password]
            
            return params
        }
    }
}
