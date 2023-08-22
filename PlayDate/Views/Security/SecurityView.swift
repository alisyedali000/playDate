//
//  SecurityView.swift
//  PlayDate
//
//  Created by عادل🫥 on 18/04/2023.
//

import SwiftUI

struct SecurityView: View {
    @Environment (\.dismiss) var dismiss
    @State  var text = ""
    @StateObject var securityVM = SecurityViewModel()
   
    
    var body: some View {
        ZStack{
            loadView()
            LoaderView(isLoading: $securityVM.showLoader)
        }
            .alert("PlayDate Error", isPresented: $securityVM.showError) {
                
            } message: {
                Text(securityVM.errorMessage)
            }
    }
}
extension SecurityView{

    func loadView()->some View{
        VStack(spacing:33){
            ZStack {
                CustomNavButton(title: "Security")
                Spacer()
            }.padding(.horizontal)
            securityTextField()
            Spacer()
            Button {
                if securityVM.isSecurityValidate() {
//                    securityVM.didMoveToSecurityProfile = true
                    Task{
                        await securityVM.forgetResetAPI()
                        self.dismiss()
                    }
                   
                }
            } label: {
                CustomButtonView(text: "Update Password")
            }
        }.padding(.horizontal)
//            .background(
//                NavigationLink("", destination: ProfileView(), isActive: $securityVM.didMoveToSecurityProfile)
//                    .hideNavigationBar
//                .hidden()
//
//            )
    }
    func securityTextField()->some View{
        VStack(spacing:20){
            PasswordTextfield(password: $securityVM.oldpassword, placeHolder: "Enter Old Password")
            PasswordTextfield(password: $securityVM.newpassword, placeHolder: "Enter New Password")
            PasswordTextfield(password: $securityVM.retypepassword, placeHolder: "Retype New Password")
        }
    }
}
struct SecurityView_Previews: PreviewProvider {
    static var previews: some View {
        SecurityView()
        SecurityView()
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
            .previewDisplayName("iPhone SE (3rd generation)")
    }
}
