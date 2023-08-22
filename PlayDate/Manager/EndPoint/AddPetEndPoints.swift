//
//  AddPetEndPoints.swift
//  PlayDate
//
//  Created by Aadil on 24/05/2023.
//

import Foundation
enum AddPetEndPoints {
    case addPet(name: String, age: String, interests: [String], colour: String, breed: String, vaccinated: String, gender: String, image: String)
    case userPets
    case userPetsUpdate(pet_id: String, name: String,interests: [String], age: String, colour: String, breed: String, vaccinated: String,gender: String)
    case imageUpdate(pet_id : String, image: String)
}
extension AddPetEndPoints: Endpoint{
    var path: String {
        switch self{
        case .addPet:
            return "\(AppUrl.APIPATCH)/pet/add_pet"
        case .userPets:
            return "\(AppUrl.APIPATCH)/user/userPets"
        case .userPetsUpdate:
            return "\(AppUrl.APIPATCH)/pet/pet"
        case .imageUpdate:
            return "\(AppUrl.APIPATCH)/pet/update_pet_image"
        }
        
    }
    
    var method: RequestMethod {
        switch self{
        case .addPet:
            return .post
        case .userPets:
            return .post
        case .userPetsUpdate:
            return .put
        case .imageUpdate:
            return .put
        }
    }
    
    var body: [String : Any?]? {
        switch self{
        case .addPet(let name, let age, let interests, let colour, let breed, let vaccinated, let gender, let image):
            
            let userID = UserDefaultManager.shared.userId
            let params = ["user_id": userID,
                          "name": name,
                          "age": age,
                          "interests": interests,
                          "colour": colour,
                          "breed": breed,
                          "vaccinated": vaccinated,
                          "gender": gender,
                          "image": image] as [String : Any]
            return params
            
        case .userPets:
            let userID = UserDefaultManager.shared.userId
            let params = ["user_id": userID]
            return params
            
        case .userPetsUpdate(let petID, let name, let interests, let age, let colour, let breed, let vaccinated, let gender):
            let params = ["pet_id": petID,
                          "name": name,
                          "interests": interests,
                          "age": age,
                          "colour": colour,
                          "breed": breed,
                          "vaccinated": vaccinated,
                          "gender": gender] as [String: Any]
            return params
        case .imageUpdate(let petID , let image):
            let params = ["pet_id": petID,
                          "image": image]
                         return params
        }
    }
    
    
}
