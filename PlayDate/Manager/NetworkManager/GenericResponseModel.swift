//
//  GenericResponseModel.swift
//  PlayDate
//
//  Created by Aadil on 17/05/2023.
//

import Foundation

struct GenericResponse: Codable {

    var message: String?
    var status: Bool?
}

struct GenericResponseModel<T: Codable>: Codable {

    var message: String?
    var status: Bool?
    var data: T?

}
