//
//  SecurityViewModel.swift
//  PlayDate
//
//  Created by Aadil on 08/05/2023.
//

import Foundation
class SecurityViewModel : ObservableObject{
    @Published var oldpassword = ""
    @Published var newpassword = ""
    @Published var retypepassword = ""
    @Published var didMoveToSecurityProfile = false
    @Published var errorMessage = ""
    @Published var showError = false
    @Published var showLoader = false
}
extension SecurityViewModel{
    func isSecurityValidate() -> Bool{
        if oldpassword.isEmpty{
            showError(message: "'Old Password' Field Can't be Empty")
            return false
        }
        if newpassword.isEmpty{
            showError(message: "'NewPassword' Field Can't be Empty")
            return false
        }
        if retypepassword.isEmpty{
            showError(message: "'Retype New Password' Field Can't be Empty")
            return false
        }
        if oldpassword.count < 6 || newpassword.count < 6{
            showError(message: "Password length must be atleast 6 characters")
            return false
        }
        if newpassword != retypepassword {
            showError(message: "'New Password' and 'Retype New Password' does not match")
            return false
        }
        return true
    }
    func showError(message: String) {
        errorMessage = message
        showError = true
    }
}
extension SecurityViewModel: NetworkManagerService {
    func forgetResetAPI() async{
        self.showLoader = true
        let endPoint: ForgotEndPoints = .forgetReset( old_password: oldpassword, new_password: newpassword)
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
