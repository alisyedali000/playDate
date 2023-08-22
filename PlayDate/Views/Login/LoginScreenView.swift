//
//  LoginView.swift
//  PlayDate
//
//  Created by عادل🫥 on 06/04/2023.
//

import SwiftUI

struct LoginScreenView: View {
    @Environment (\.dismiss) var dismiss
    @StateObject var loginVM =  LoginViewModel()
    @FocusState var isFocused: Bool
    @State private var isActive = false
   
   
    
    var body: some View {
        
        ZStack{
            loadView()
            LoaderView(isLoading: $loginVM.showLoader)
        }
            .alert("PlayDate Error", isPresented: $loginVM.showError) {
                
            } message: {
                Text(loginVM.errorMessage)
            }
            .onReceive(RootController.auth) { newValue in
                print(newValue)
                isActive = newValue
            }
        
        
    }
    func textField()->some View{
        VStack(spacing:24){
            CustomTextfield(placeholder: "Enter Your Email", image: "Letter", text: $loginVM.email)
                .keyboardType(.emailAddress)
            PasswordTextfield(password: $loginVM.password, placeHolder: "Password")
            
            
        }.padding()
        
    }
}
extension LoginScreenView{
    func loadView() -> some View {
        VStack(spacing:0){
            LoginImage()
            TitleText()
            textField()
            ForgotText()
            
            AppButton(title: "Log In") {
                if loginVM.isAuthValid() {
                    Task {
                        await loginVM.loginAPI()
                    }
                }
            }.padding()
            
            SocialIcon()
            SignUpText()
            Spacer()
            
            
            
        }
        .background(
            NavigationLink("", destination: TabBarControllerView(), isActive: $loginVM.moveToNext)
            
                .hideNavigationBar
                .hidden()
            
        )
        
        
        
    }
    
    
    func LoginImage()->some View{
        GeometryReader{ geo in
            Image("PLAY DATE")
                .resizable()
                .scaledToFit()
                .frame(width:geo.size.width)
                .frame(width:geo.size.width, height: geo.size.height * 1.7)
                .frame(width: geo.size.width, height: geo.size.height * 1.4)
            
            
            
        }
        
        
    }
    func TitleText()->some View{
        
        Text("Log In to Continue")
            .font(.custom(DMSans.bold.rawValue, size: 24))
            .foregroundColor(.newCustomcolor)
        
    }
    func SignUpText()->some View{
        HStack(){
            Text("You don’t have an account yet?")
                .font(.custom(DMSans.bold.rawValue, size: 17))
                .foregroundColor(.newAColor)
            NavigationLink {
                SignUpView()
                    .hideNavigationBar
            } label: {
                
                Text("Sign Up")
                    .font(.custom(DMSans.bold.rawValue, size: 17))
                    .foregroundColor(.newCustomcolor)
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
    func ForgotText()-> some View{

        HStack{
            Spacer()
            Button(action: {
                isActive = true
            }) {
                
                Text("Forgot Password?")
                    .font(.custom(DMSans.bold.rawValue, size: 12))
                    .foregroundColor(.newCustomcolor)
                    .padding(.trailing)
            }
        }
        .background(
            NavigationLink("", destination: ForgotPasswordView(), isActive: $isActive)
            
            .hidden()
        )

        
    }
}

struct LoginScreenView_Previews: PreviewProvider {
    static var previews: some View {
        
        LoginScreenView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
            .previewDisplayName("iPhone 14 Pro Max")
        
        LoginScreenView()
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
            .previewDisplayName("iPhone SE (3rd generation)")
        
    }
    
}
