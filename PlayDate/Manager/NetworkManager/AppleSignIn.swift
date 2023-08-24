//
//  SwiftUIView.swift
//  PlayDate
//
//  Created by Ali Syed on 24/08/2023.
//


import SwiftUI
import UIKit
import AuthenticationServices

class AppleSignIn: NSObject, ObservableObject {
    
    @Published var state: SignInState = .signedOut
   
    var completionHandler: (_ appleCredentials: ASAuthorizationAppleIDCredential) -> Void = { _ in }

    @objc func handleAppleIdRequest(block: @escaping (_ appleCredentials: ASAuthorizationAppleIDCredential) -> Void) {
        completionHandler = block
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.performRequests()
    }

    func getCredentialState(userID: String) {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        appleIDProvider.getCredentialState(forUserID: userID) { credentialState, _ in
            switch credentialState {
            case .authorized:
     
                
                break
            case .revoked:
                self.state = .signedOut
                break
            case .notFound:
             
                break
            default:
                break
            }
        }
    }
}

extension AppleSignIn: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
//            getting user details
            let userIdentifier = appleIDCredential.user
            let fullName = appleIDCredential.fullName
            let email = appleIDCredential.email
            let token = userIdentifier
            debugPrint("User id is \(token) \n Full Name is \(String(describing: fullName)) \n Email id is \(String(describing: email))")

            completionHandler(appleIDCredential)

            getCredentialState(userID: userIdentifier)
        }
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        // Handle error.
        debugPrint("error in sign in with apple: \(error.localizedDescription)")
    }
}

extension AppleSignIn{
    
    enum SignInState {
      case signedIn
      case signedOut
    }

    
    
    
    func signIn() {
        
            handleAppleIdRequest { appleCredentials in
            
            print(appleCredentials.fullName?.givenName)
            print(appleCredentials.email)
         
            self.state = .signedIn
                
                
                
        }
    }
    
    func signOut(){
//        UserDefaultManager.Authenticated.send(false)
        self.state = .signedOut
    }
    
    
    
    
}
