//
//  ResetViewModel.swift
//  PlayDate
//
//  Created by Aadil on 08/05/2023.
//

import Foundation
class ResetViewModel: ObservableObject{
    @Published var password = ""
    @Published var confromPassword = ""
    @Published var errorMessage = ""
    @Published var showError = false
    @Published var showLoader = false
   
    
}
extension ResetViewModel{
    func isResetValid()->Bool{
        if password.isEmpty || confromPassword.isEmpty{
            showError(message: "Reset Password Credentials are Empty")
            return false
        }
        if password.count < 6 {
            showError(message: "Password length must be atleast 6 characters")
            return false
        }
        if password != confromPassword {
            showError(message: "Password and Confirm password does not match")
            return false
        }
        return true
    }
    func showError(message: String) {
        errorMessage = message
        showError = true
    }
   
}
extension ResetViewModel: NetworkManagerService {
  @MainActor  func updatePasswordAPI(userId: Int) async {
        self.showLoader = true
        let endPoint: ForgotEndPoints = .updatePassword( user_id: userId, password: password)
        let request = await sendRequest(endpoint: endPoint, responseModel: GenericResponse.self)
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
