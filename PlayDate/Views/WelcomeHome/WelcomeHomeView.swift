//
//  WelcomeHomeView.swift
//  PlayDate
//
//  Created by عادل🫥 on 08/04/2023.
//

import SwiftUI

struct SplashView: View {
    @State  var text = ""
    var body: some View {
        loadView()
            .ignoresSafeArea()
    }
}
extension SplashView{
    func loadView()->some View{
        VStack(spacing:20){
            welcomeImage()
            WelcomeText()
            NavigationLink {
              SocialLoginView()
                    .hideNavigationBar
            } label: {
               CustomButtonView(text:"Get Started")
                
            }
           
            
        }.padding()
         
    }
}
func welcomeImage()->some View{
    GeometryReader{ geo in
        Image("WelcomeImage")
            .resizable()
            .scaledToFit()
            .frame(width:geo.size.width * 1)
            .frame(width:geo.size.width, height: geo.size.height)
            .frame(width: geo.size.width, height:  geo.size.height * 1)
          
    }
}
func WelcomeText()->some View{
    
    VStack(spacing:5){
        Text("Welcome to Play Date")
            .font(.custom(DMSans.bold.rawValue, size: 25))
            .foregroundColor(.black)
            .padding(.trailing,65)
        Text("Find Best Friend & Playmates for you dog.")
            .font(.custom(DMSans.regular.rawValue, size: 17))
            .foregroundColor(.newGREY64)
            .padding(.trailing,11)
        
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
    
        SplashView()
                   .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
                   .previewDisplayName("iPhone 14 Pro Max")
        
        SplashView()
                   .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
                   .previewDisplayName("iPhone SE (3rd generation)")
    }
}
