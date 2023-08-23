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
    
    init() {
        setupAuthentication()
    }
    
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView()
            }
            .environmentObject(google)
        }
    }
    
}


extension PlayDate {
  private func setupAuthentication() {
    FirebaseApp.configure()
  }
}




