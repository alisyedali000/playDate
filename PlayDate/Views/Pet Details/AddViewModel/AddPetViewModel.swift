//
//  AddPetViewModel.swift
//  PlayDate
//
//  Created by Aadil on 09/05/2023.
//

import Foundation
class AddPetViewModel: ObservableObject{
    
    @Published var base64Image = ""
    @Published var nametext = ""
    @Published var interest = ""
    @Published var totalInterests: [String] = []
    @Published var age = ""
    @Published var gender = ""
    @Published var breedSelection = ""
    @Published var colorSelection = ""
    @Published var errorMessage = ""
    @Published var isVaccinated = true
    @Published var showError = false
    @Published var didmoveToAdd = false
    @Published var showresult = ""
    @Published var showLoader = false
    @Published var petData: [AddPetModel] = []
    
}
extension AddPetViewModel{
   
    func isValidateAddDetails() ->Bool{

        if nametext.isEmpty{
            showError(message: "enter PET name")
            return false
        }
        if interest.isEmpty{
            showError(message: "enter PET Interest")
            return false
        }
        if age.isEmpty{
            showError(message: "enter PET age")
        }
        if gender.isEmpty{
            showError(message: "select PET gender")
            return false
        }
        if colorSelection.isEmpty{
            showError(message: "select PET color")
        }
        if breedSelection.isEmpty{
            showError(message: "select PET breed")
            return false
        }
       

        return true
    }
    func showError(message: String) {
        errorMessage = message
        showError = true
    }
  
}
extension AddPetViewModel: NetworkManagerService{
    func AddPetAPI( completion: @escaping () -> Void) async {
        self.showLoader = true
        let endPoint: AddPetEndPoints = .addPet(name: nametext, age: age, interests: totalInterests , colour: colorSelection, breed: breedSelection, vaccinated: isVaccinated ? "1" : "0", gender: gender, image: base64Image)
        
        print(endPoint)
        
        let request = await sendRequest(endpoint: endPoint, responseModel: GenericResponseModel<[AddPetModel]>.self)
        self.showLoader = false
        switch request {
            
        case .success(let data):
            
            debugPrint(data.message ?? "")
           
            petData = data.data ?? []
            
            completion()
            
           
        case .failure(let error):
            debugPrint(error.customMessage)
        }
    }
    func userPetsAPI() async{
        DispatchQueue.main.async {
            self.showLoader = true
        }
        
        let endPoint: AddPetEndPoints = .userPets
        let request = await sendRequest(endpoint: endPoint, responseModel: GenericResponseModel<[AddPetModel]>.self)
        DispatchQueue.main.async {
            self.showLoader = false
        }
        switch request {
        case .success(let data):
            debugPrint(data.message ?? "")
            
            DispatchQueue.main.async {
                self.petData = data.data ?? []
            }
            
        case .failure(let error):
            debugPrint(error.customMessage)
        }
    }
    
}


