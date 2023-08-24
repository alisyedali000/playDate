//
//  ContentView.swift
//  PlayDate
//
//  Created by عادل🫥 on 05/04/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var isAuthenticated = UserDefaultManager.IsAuthenticated()
    @EnvironmentObject var google: GoogleAuthentication
    @EnvironmentObject var apple: AppleSignIn
    
    var combinedAuthenticationState: Bool {
        return google.state == .signedIn || apple.state == .signedIn
    }
    
    var body: some View {
        Group {
            if combinedAuthenticationState || isAuthenticated{
                TabBarControllerView()
                    .hideNavigationBar
            
            } else {
                SplashView()
            }
        }
        .onReceive(UserDefaultManager.Authenticated) { newValue in
            isAuthenticated = newValue
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
