//
//  SignUpViewModel.swift
//  PlayDate
//
//  Created by Aadil on 08/05/2023.
//

import Foundation
import Combine

class SignUpViewModel: ObservableObject {
    
    
    @Published  var username = ""
    @Published  var email = ""
    @Published  var password = ""
    @Published  var confrmPassword = ""
    @Published  var moveToNext = false
    @Published var errorMessage = ""
    @Published var showError = false
    @Published var showLoader = false

 
    }



// pure swift function
extension SignUpViewModel {
    func isDataValid()-> Bool{
        if username.isEmpty {
            showError(message: "User Name is empty")
            return false
        }
        
        if !Validator.shared.isValidEmail(email: email) {
            showError(message: "Email is not Valid")
            return false
        }
        
        if password != confrmPassword {
            showError(message: "Password and Confirm password does not match")
        }
        
        if password.count < 6 {
           showError(message: "Password length must be atleast 6 characters")
        }
        
        return true
    }
    
    
    func showError(message: String) {
        errorMessage = message
        showError = true
    }
    
}
extension SignUpViewModel: NetworkManagerService {
    func signupAPI() async{
        self.showLoader = true
        let endPoint : SignUpEndPoints = .signup(name: username, email: email, password: password, fireBase_id: "1212", device_id: "sbdjagjdahgsdj")
        let request = await sendRequest(endpoint: endPoint, responseModel: GenericResponseModel<User>.self)
        self.showLoader = false
        switch request {
            
        case .success(let data):
            
            debugPrint(data.message ?? "")
            debugPrint(data.status ?? "")
            debugPrint(data.data)
            
            UserDefaultManager.shared.set(user: data.data ?? User())
            UserDefaultManager.Authenticated.send(true)
            self.moveToNext.toggle()
            
            
        case .failure(let error):
            debugPrint(error.customMessage)
        }
    }
}

