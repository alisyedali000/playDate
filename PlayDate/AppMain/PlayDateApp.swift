//
//  PlayDateApp.swift
//  PlayDate
//
//  Created by Ali Syed.
//




import Firebase
import GoogleSignIn
import SwiftUI




@main
struct PlayDate: App {
    
    
    @StateObject var google = GoogleAuthentication()
    @StateObject var apple = AppleSignIn()
    
    init() {
        setupAuthentication()
    }
    
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView()
            }
            .environmentObject(google)
            .environmentObject(apple)
        }
    }
    
}


extension PlayDate {
  private func setupAuthentication() {
    FirebaseApp.configure()
  }
}




