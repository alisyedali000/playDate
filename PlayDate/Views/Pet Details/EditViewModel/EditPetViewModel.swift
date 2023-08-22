//
//  EditPetViewModel.swift
//  PlayDate
//
//  Created by Aadil on 09/05/2023.
//

import Foundation
class EditPetViewModel: ObservableObject{
    @Published var base64Image = ""
    @Published var nametext = ""
    @Published var interest = ""
    @Published var totalInterests: [String] = []
    @Published var age = ""
    @Published var gender = ""
    @Published var breed = ""
    @Published var color = ""
    @Published var didmoveToSubmit = false
    @Published var errorMessage = ""
    @Published var showError = false
    @Published var isVaccinated = true
    @Published var editData: [AddPetModel] = []
    @Published var showLoader = false
    
}
extension EditPetViewModel{
   
    func isVlidateEdit()->Bool{
        
        if nametext.isEmpty {
            showError(message: "enter PET name")
            return false
        }
        if totalInterests.isEmpty{
            showError(message: "enter PET interest")
            return false
        }
        if age.isEmpty{
            showError(message: "enter PET age")
            return false
        }
        if gender.isEmpty{
            showError(message: "select PET gender")
        }
        if breed.isEmpty{
            showError(message: "select PET breed")
            return false
        }
        if color.isEmpty{
            showError(message: "select PET color")
        }
        return true
    }
    func showError(message: String) {
        errorMessage = message
        showError = true
    }
}
extension EditPetViewModel: NetworkManagerService{
    func updatePetAPI(petID: String) async{
        
        let endPoint: AddPetEndPoints = .userPetsUpdate(pet_id: petID, name: nametext,interests: totalInterests,age: age, colour: color, breed: breed, vaccinated: isVaccinated ? "1" : "0", gender: gender)
            let request = await sendRequest(endpoint: endPoint, responseModel: GenericResponseModel<[AddPetModel]>.self)
       debugPrint(endPoint)
            switch request{
                
                
            case .success(let data):
                
                debugPrint(data.message ?? "")
                DispatchQueue.main.async {
                    self.editData = data.data ?? []
                    
                }
          
            case .failure(let error):
                
                debugPrint(error.customMessage)
            }
        }
    
    
    func imageAPI(petID: String) async{
        let endPoint: AddPetEndPoints = .imageUpdate(pet_id: petID, image: base64Image)
        let request = await sendRequest(endpoint: endPoint, responseModel: GenericResponseModel<AddPetModel>.self)
        debugPrint(endPoint)
        switch request {
        case .success(let data):
            debugPrint(data.message ?? "")
            
          
            
        case .failure(let error):
            debugPrint(error.customMessage)
        }
    }
    func deleteUserAPI() async{
        self.showLoader = true
        let endPoint: DeleteUserEndPoints = .deleteUser
        let request = await sendRequest(endpoint: endPoint, responseModel:  GenericResponse.self)
        self.showLoader = false
        
        switch request {
        case .success(let data):
            debugPrint(data.message ?? "")
            debugPrint(data.status ?? "")
          
        case .failure(let error):
            debugPrint(error.customMessage)
        }
    }
}


