//
//  SignUpEndPoints.swift
//  PlayDate
//
//  Created by Aadil on 17/05/2023.
//

import Foundation
enum SignUpEndPoints {
    case signup(name:String ,email: String , password: String, fireBase_id: String, device_id: String)
}
extension SignUpEndPoints : Endpoint {
    var path: String {
        switch self {
        case .signup :
            return "\(AppUrl.APIPATCH)/auth/register"
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .signup :
            return .post
        }
    }
    
    var body: [String : Any?]? {
        switch self {
        case .signup(let name, let email, let password, let fireBase_id, let device_id ):
            let params = ["name": name, "email": email ,  "password": password, "fireBase_id": fireBase_id, "device_id": device_id]
            return params
        }
    }
    
    
}
