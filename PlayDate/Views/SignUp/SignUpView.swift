//
//  SignUpView.swift
//  PlayDate
//
//  Created by عادل🫥 on 07/04/2023.
//

import SwiftUI

struct SignUpView: View {
    
    @Environment (\.dismiss) var dismiss
    @StateObject var vm = SignUpViewModel()
    @State private var isActive = false
    
    var body: some View {
        ZStack{
            loadView()
            LoaderView(isLoading: $vm.showLoader)
        }
            .alert("PlayDate Error", isPresented: $vm.showError) {
                
            } message: {
                Text(vm.errorMessage)
            }
        
    }
    func SignUpTextField()->some View{
        VStack(spacing:25){
            
            CustomTextfield(placeholder: "Username", image: "User", text: $vm.username)
            
            CustomTextfield(placeholder: "Enter Your Email", image: "Letter", text: $vm.email)
                .keyboardType(.emailAddress)
            PasswordTextfield(password: $vm.password, placeHolder: "Password")
            
            PasswordTextfield(password: $vm.confrmPassword, placeHolder: "Confirm Password")
            
        }
    }
    
}

extension SignUpView{
    func loadView()->some View{
        VStack(alignment: .leading){
            Spacer()
            VStack(alignment: .leading, spacing: 16) {
                LeadingText()
                DiscoverText()
            }
            
            Spacer()
            
            SignUpTextField()
            Spacer()
            
            AppButton(title: "Create Account") {
                if vm.isDataValid() {
                    Task {
                        await vm.signupAPI()
                    }
                }
            }
            
            
            VStack {
                SocialIcon()
                SignInText()
            }
            
            Spacer()
            
            
        }.padding(.horizontal)
            .background(
                NavigationLink("", destination: TabBarControllerView(), isActive: $vm.moveToNext)
                
                    .hideNavigationBar
                    .hidden()
                
            )

        
        
        
        
    } 
    
    func LeadingText()->some View{
        HStack(spacing:50){
            Text("Join us to start your\njourney!")
                .font(.custom(DMSans.regular.rawValue, size: 24))
                .foregroundColor(.newCustomcolor)
            Spacer()
            Image("India")
                .frame(width:32,height: 32)
            
        }
        
    }
    func DiscoverText()->some View{
        VStack(){
            Text("Discover your perfect Dog companion.")
                .font(.custom(DMSans.bold.rawValue, size: 13))
                .foregroundColor(.newAColor)
        }
        
    }
    func SignInText()->some View{
        HStack(){
            Text("Already have an Account?")
                .font(.custom(DMSans.bold.rawValue, size: 17))
                .foregroundColor(.newAColor)

            Button {
                self.dismiss()
            } label: {
                Text("Signin")
                    .font(.custom(DMSans.bold.rawValue, size: 17))
                    .foregroundColor(.newSColor)
            }

        }
        
    }
    func SocialIcon()->some View{
        VStack(){
            HStack(){
                
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.newLineColor)
                
                Text("or")
                    .font(.custom(DMSans.bold.rawValue, size: 16))
                    .foregroundColor(.newCustomcolor)
                
                
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.newLineColor)
                
                
                
                
                
                
            }
            HStack{
                
                ZStack {
                    Circle()
                        .frame(width: 35, height: 35)
                        .foregroundColor(.white)
                        .shadow(radius: 2)
                    
                    Image(AppImages.appleLogo.rawValue)
                    
                }
                
                ZStack{
                    Circle()
                        .frame(width:35,height:35)
                        .foregroundColor(.white)
                        .shadow(radius: 2)
                    Image(AppImages.googlelogo.rawValue)
                }
                
                
            }.padding()
            
        }
        
    }
}


struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

