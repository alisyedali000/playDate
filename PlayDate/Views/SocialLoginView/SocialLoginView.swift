//
//  SplashScreenView.swift
//  PlayDate
//
//  Created by عادل🫥 on 05/04/2023.
//

import SwiftUI

struct SocialLoginView: View {
    @EnvironmentObject var apple : AppleSignIn
    @EnvironmentObject var google : GoogleAuthentication
    
    
    @State  var text = ""
    var body: some View {
        
        loadView()
    }
}

extension SocialLoginView {
    
    func loadView() -> some View {
        
        VStack {
            splashImage()
            
            titleTexts()
            
            socialSignupBtns()
            
            Spacer()
           
            
            NavigationLink {
            LoginScreenView()
                    .hideNavigationBar
                   
            }
        label: {
           CustomButtonView(text:"Login or Signup with Email")
           
            }
            
            
        }.padding()
          
    }
    
    func splashImage() -> some View {
        GeometryReader{ geo in
            Image("splashImage")
                .resizable()
//                .frame(width:geo.size.width * 1)
//                .frame(width:geo.size.width, height: geo.size.height)
//                .frame(width:geo.size.width, height: geo.size.height * 0.9)
                .scaledToFit()
        }
    }
    
    func titleTexts() -> some View {
        
        VStack(spacing:9) {
                Text("Continue to App")
                .font(.custom(DMSans.bold.rawValue, size: 25))
                    .foregroundColor(.newCCOLOR)
                    Text("The dependable mobile app for finding best friend & Play mate for your dog.")
                    .multilineTextAlignment(.center)
                        .font(.custom(DMSans.regular.rawValue,size: 17))
                        .foregroundColor(.newGREY64)
                
            }
        
        }
        
    
    
    
    func loginSignupBtn() -> some View {
        
        ZStack (){
            
            Image("buttonImage")
                .resizable()
                .frame(height: 60)
            
            
            Text("Login/Signup with Email")
                .foregroundColor(.white)
                .font(.custom(DMSans.bold.rawValue, size: 20))
               
        }
    }
    
    func socialSignupBtns() -> some View {
        
        VStack(spacing:32) {
            
            VStack(spacing:15) {
                
                
                socialLoginBtn(image: AppImages.appleLogo.rawValue, title: "Sign in / Sign up with Apple"){
                    apple.signIn()
                }
                
                socialLoginBtn(image: AppImages.googlelogo.rawValue, title: "Sign in / Sign up with Google"){
                    
                    google.signIn()
                }
            }
            
            HStack(){
                
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.newLineColor)
                
                Text("OR")
                    .font(.custom(DMSans.bold.rawValue, size: 16))
                    .foregroundColor(.newCustomcolor)
                
                
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.newLineColor)
            }
            
            
        }
    }
    
               
            
        
    }
    

    func socialLoginBtn(image: String, title: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            RoundedRectangle(cornerRadius: 5)
                .frame(height: 50)
                .foregroundColor(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray, lineWidth: 1.5)
                        .overlay(
                            HStack {
                                Image(image)
                                Text(title)
                            }
                        )
                        .foregroundColor(.black)
                        .font(.custom(DMSans.regular.rawValue, size: 16))
                )
        }
}


struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        
        SocialLoginView()

    }
}

