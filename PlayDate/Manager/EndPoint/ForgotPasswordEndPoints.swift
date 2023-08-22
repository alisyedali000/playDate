//
//  ForgotEndPoints.swift
//  PlayDate
//
//  Created by Aadil on 18/05/2023.
//

import Foundation
enum ForgotEndPoints {
    case forgotPassword(email: String)
    case verifyOTP(email: String, otp: String)
    case updatePassword(user_id: Int, password: String)
    case forgetReset( old_password: String, new_password: String)
}

extension ForgotEndPoints: Endpoint {
    var path: String {
        switch self {
            
        case .forgotPassword:
            return "\(AppUrl.APIPATCH)/forgetPassword/generate_otp"
        case .verifyOTP:
            return "\(AppUrl.APIPATCH)/forgetPassword/verify_otp"
        case .updatePassword:
            return "\(AppUrl.APIPATCH)/forgetPassword/create_password"
        case .forgetReset:
            return "\(AppUrl.APIPATCH)/forgetPassword/reset_password"
          
        }
    }
    
    var method: RequestMethod {
        switch self {
            
        case .forgotPassword:
            return .post
        case .verifyOTP:
            return .post
        case .updatePassword:
            return .post
        case .forgetReset:
            return .post
        }
    }
    
    var body: [String : Any?]? {
        switch self {
            
        case .forgotPassword(let email):
            let params = ["email": email]
            return params
        case .verifyOTP(let email, let otp):
            let params = ["email": email, "otp": otp]
            return params
        case .updatePassword(let user_id, let password):
            
            let params = ["user_id": "\(user_id)",
                          "password": password]
            return params
            
        case .forgetReset( let old_password, let new_password):
            let user_id = UserDefaultManager.shared.userId
            let params = ["user_id": "\(user_id)",
                          "old_password": old_password,
                          "new_password": new_password]
            return params
        }
    }
}
    
    
