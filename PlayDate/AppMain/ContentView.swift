//
//  ContentView.swift
//  PlayDate
//
//  Created by عادل🫥 on 05/04/2023.
//

import SwiftUI

struct ContentView: View {
  
    @State private var isAuthenticated = UserDefaultManager.IsAuthenticated()
    
    var body: some View {
        
        Group {
            /// if user is already logged in
            if isAuthenticated {
                
                TabBarControllerView()
                    .hideNavigationBar
            } else {
                /// else if user is not logged in
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
