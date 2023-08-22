//
//  ForgotViewModel.swift
//  PlayDate
//
//  Created by Aadil on 08/05/2023.
//

import Foundation
class ForgotViewModel: ObservableObject{
    @Published var email = ""
    @Published var otpText = ""
    @Published  var moveToReset = false
    @Published var isShowOTP = false
    @Published var errorMessage = ""
    @Published var showError = false
    @Published var showLoader = false
    @Published var userId = 0
 
}
extension ForgotViewModel{
    
  @MainActor  func isValidateEmail()-> Bool{
        if email.isEmpty && !Validator.shared.isValidEmail(email: email){
            showError(message: "Enter Valid Email")
            return false
        }
        if !Validator.shared.isValidEmail(email: email){
            showError(message: "Email is not Valid")
            return false
        }
        
        return true
       
       
    }
    
    func showError(message: String) {
        errorMessage = message
        showError = true
    }
    func isValidateOTP()->Bool{
        if otpText.isEmpty{
            showError(message: "Enter Valid OTP")
            return false
        }
        if otpText.count < 4{
            showError(message: "Enter Valid OTP")
        }
        return true
        
            
        
    }
}
extension ForgotViewModel: NetworkManagerService{
  @MainActor  func forgotAPI() async{
        self.showLoader = true
        let endPoint: ForgotEndPoints = .forgotPassword(email: email)
        let request = await sendRequest(endpoint: endPoint, responseModel: GenericResponse.self)
        
        self.showLoader = false
        
        switch request {
            
        case .success(let data):
            
            debugPrint(data.message ?? "")
            debugPrint(data.status ?? "")
            isShowOTP.toggle()
            
        case .failure(let error):
            debugPrint(error.customMessage)
        }
        
    
        
    }

   @MainActor func otpAPI() async {
        self.showLoader = true
        if isValidateOTP(){
            let endPoint: ForgotEndPoints = .verifyOTP(email: email, otp: otpText)
            let request = await sendRequest(endpoint: endPoint, responseModel: GenericResponseModel<User>.self)
            self.showLoader = false
            switch request {
                
            case .success(let data):
                
                debugPrint(data.message ?? "")
                debugPrint(data.status ?? "")
                self.userId = data.data?.id  ?? 0
                self.moveToReset.toggle()
                
            case .failure(let error):
                debugPrint(error.customMessage)
            }
        }
        
    }
    
        
    }
    

