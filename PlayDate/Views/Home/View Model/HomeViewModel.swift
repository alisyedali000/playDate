//
//  HomeViewModel.swift
//  PlayDate
//
//  Created by عادل🫥 on 02/05/2023.
//
import Foundation
import SwiftUI
class HomeViewModel: ObservableObject {
    @Published var fetched_users: [userModel]? = []
    @Published var imagebase64 = ""
    @Published var name = ""
    @Published var vaccinated = ""
    @Published var breed = ""
    @Published var gender = ""
    @Published var age = ""
    @Published var interest : [String] = []
    @Published var showLoader = false
    
    
    func getIndex(user:userModel)->Int{
        let index = fetched_users?.firstIndex(where: {currentUser in
            return user.id == currentUser.id
        }) ?? 0
        return index
    }
}
extension HomeViewModel: NetworkManagerService {
    func swipeCardAPI(age: String, breed: String, interests: [String]) async {
        self.showLoader = true
        let endPoint: HomeEndPoints = .homeSwipeCard(age: age, breed: breed, interests: interest)
        let request = await sendRequest(endpoint: endPoint, responseModel: GenericResponseModel<[userModel]>.self)
        self.showLoader = false
        switch request {
            
            
        case .success(let data):
            debugPrint(data.message ?? "")
            fetched_users = data.data ?? []
            
        case .failure(let error):
            debugPrint(error.customMessage)
        }
    }
}



