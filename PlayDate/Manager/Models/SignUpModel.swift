//
//  SignUpModel.swift
//  PlayDate
//
//  Created by Aadil on 17/05/2023.
//

import Foundation
struct SignUpModel: Codable {
    let id: Int?
    let name, email, status, lat: String?
    let longi, emailCode, fCode, gToken: String?
    let fbToken, aCode, fireBaseID, deviceID: String?
    let image: String?
    let deletedAt: String?
    let createdAt, updatedAt, address: String?

    enum CodingKeys: String, CodingKey {
        case id, name, email, status, lat, longi
        case emailCode = "email_code"
        case fCode = "f_code"
        case gToken = "g_token"
        case fbToken = "fb_token"
        case aCode = "a_code"
        case fireBaseID = "fireBase_id"
        case deviceID = "device_id"
        case image
        case deletedAt = "deleted_at"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case address
    }
}
extension SignUpModel{
    init(){
        self.id = 0
        self.name = ""
        self.email = ""
        self.status = ""
        self.lat = ""
        self.longi = ""
        self.emailCode = ""
        self.fCode = ""
        self.gToken = ""
        self.fbToken = ""
        self.aCode = ""
        self.fireBaseID = ""
        self.deviceID = ""
        self.image = ""
        self.deletedAt = ""
        self.createdAt = ""
        self.updatedAt = ""
        self.address = ""
    }
}
