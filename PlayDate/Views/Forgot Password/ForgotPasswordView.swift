//
//  ForgotPasswordView.swift
//  PlayDate
//
//  Created by عادل🫥 on 10/04/2023.
//

import SwiftUI

struct ForgotPasswordView: View {
    @Environment (\.dismiss) var dismiss
    @State  var txt = ""
    @State var text = ""
    @State private var isLoading = true
    @State private var isActive = false
   @StateObject var vm = ForgotViewModel()
    var body: some View {
        ZStack {
            
            loadView()
            
            LoaderView(isLoading: $vm.showLoader)
        }
            .alert("PlayDate Error", isPresented: $vm.showError) {
                
            } message: {
                Text(vm.errorMessage)
            }
    }
}
extension ForgotPasswordView{
    func loadView()->some View{
        VStack(spacing: 30) {
            ZStack {
                    CustomNavButton(title: "")
            }.padding(.horizontal)
            ForgotImage()
            ForgetText()
            forgotTextField()
            
            
            
            if vm.isShowOTP{
                OTPTextField(OTPText: $vm.otpText)
            }
            Spacer()
            
            AppButton(title: vm.isShowOTP ? "Next" : "Send OTP") {
             
                if vm.isShowOTP {
                    
                    if vm.isValidateOTP() {
                        Task {
                            await vm.otpAPI()
                          
                            
                        }
                    }
                }
                else {
                    if vm.isValidateEmail(){
                        Task {
                            await vm.forgotAPI()
                        }
                        
                    }
                }
                
                
                  
                }
            
            
        }.padding()
            .background(
                NavigationLink("", destination: ResetPasswordView(userId: vm.userId), isActive: $vm.moveToReset)
                    .hideNavigationBar
                .hidden()

            )
            
    }
    func forgotTextField()->some View{
        VStack(){
            CustomTextfield(placeholder: "Enter Your Email", image: "Letter", text: $vm.email)
                .keyboardType(.emailAddress)
                .onChange(of: vm.email) { newValue in
                    self.vm.isShowOTP = false
                }
            
        }
    }
}
func ForgotImage()->some View{
    VStack{
        Image("Lock Password")
            .resizable()
            .frame(width:50,height: 50)
    }
}
func ForgetText()->some View{
    VStack(spacing:5){
        Text("Forgot Password?")
            .font(.custom(DMSans.bold.rawValue, size: 24))
            .foregroundColor(.newCustomcolor)
        Text("We can help you reset your password. Send us email.")
            .font(.custom(DMSans.regular.rawValue, size: 13))
            .foregroundColor(.newAColor)
       
    }
}



struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView()
    }
}
