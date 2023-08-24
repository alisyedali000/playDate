//
//  GoogleSignIn.swift
//  PlayDate
//
//  Created by Ali Syed on 24/08/2023.
//




import Firebase
import GoogleSignIn
import SwiftUI



class GoogleAuthentication: ObservableObject {

  enum SignInState {
    case signedIn
    case signedOut
  }

  
  @Published var state: SignInState = .signedOut
    
    func signIn() {
 
        if GIDSignIn.sharedInstance.hasPreviousSignIn() {
            GIDSignIn.sharedInstance.restorePreviousSignIn { [unowned self] user, error in
                authenticateUser(for: user, with: error)
            }
        } else {
      
            guard let clientID = FirebaseApp.app()?.options.clientID else { return }
            
      
            let configuration = GIDConfiguration(clientID: clientID)
            
          
            guard let presentingViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {return}
            
           
            GIDSignIn.sharedInstance.signIn(with: configuration, presenting: presentingViewController) { user, error in
                self.authenticateUser(for: user, with: error)
                
            }
        }
    }
    
    private func authenticateUser(for user: GIDGoogleUser?, with error: Error?) {

      if let error = error {
        print(error.localizedDescription)
        return
      }
      
      
      guard let authentication = user?.authentication, let idToken = authentication.idToken else { return }
      
      let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)
      
 
      Auth.auth().signIn(with: credential) { [unowned self] (_, error) in
        if let error = error {
          print(error.localizedDescription)
        } else {
          self.state = .signedIn
//        UserDefaultManager.shared.set(user: data.data ?? User())
        UserDefaultManager.Authenticated.send(true)
            
        }
      }
    }
    
    
    func signOut() {
  
      GIDSignIn.sharedInstance.signOut()
      
      do {
     
        try Auth.auth().signOut()
        
        state = .signedOut
//        UserDefaultManager.Authenticated.send(false)
      } catch {
        print(error.localizedDescription)
      }
    }
    
    
}




