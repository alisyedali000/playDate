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
    
    var body: some View {
        Group {
            switch google.state {
            case .signedIn:
                TabBarControllerView()
                    .hideNavigationBar
                
            case .signedOut:
                if isAuthenticated {
                    HomeView() 
                } else {
                    SplashView()
                }
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
