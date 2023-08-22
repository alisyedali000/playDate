//
//  LoginViewModel.swift
//  PlayDate
//
//  Created by Aadil on 08/05/2023.
//

import Foundation
class LoginViewModel: ObservableObject{
    @Published var email = ""
    @Published  var password = ""
    @Published var text = ""
    @Published var errorMessage = ""
    @Published var showError = false
  @Published  var moveToNext = false
    @Published var showLoader = false
}
extension LoginViewModel {
    func isAuthValid()-> Bool{
        if !Validator.shared.isValidEmail(email: email){
            showError(message: "Email is not Valid")
            return false
        }
        if password.count < 6 {
            showError(message: "Password length must be atleast 6 characters")
            return false
        }
        return true
    }
    func showError(message: String) {
        errorMessage = message
        showError = true
    }
}

extension LoginViewModel : NetworkManagerService {
    
    func loginAPI() async {
        self.showLoader = true
        let endPoint: LoginEndPoints = .login(email: email, password: password)
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

