//
//  PasswordTextfield.swift
//  PlayDate
//
//  Created by Aadil on 09/05/2023.
//

import SwiftUI

struct PasswordTextfield: View {
    
    @Binding var password: String
    @FocusState var isFocused: Bool
    var placeHolder: String
    @State private var isSecure = true
    
    var body: some View {
        loadView()
    }
}

// View Setting
extension PasswordTextfield {
    
    func loadView() -> some View {
        ZStack(alignment: .trailing) {
            
            
            
            Group {
                isSecure ? AnyView(secureTF()) : AnyView(normalTF())

            }
            hideShowButton()
        }
        
        
    }
    
    func secureTF() -> some View {
        
        
        SecureField(placeHolder, text: $password)
            .font(.custom(DMSans.regular.rawValue, size: 14))
            .padding(20)
            .focused($isFocused)
            .background(Color.newTFColor)
            .cornerRadius(15)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(isFocused ? .gray.opacity(0.7) :
                            .gray.opacity(0) , lineWidth: 0)
            )
        
    }
    
    func normalTF() -> some View {
        
        
        TextField(placeHolder, text: $password)
            .font(.custom(DMSans.regular.rawValue, size: 14))
            .padding(20)
            .focused($isFocused)
            .background(Color.newTFColor)
            .cornerRadius(15)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(isFocused ? .gray.opacity(0.7) :
                            .gray.opacity(0) , lineWidth: 0)
            )
        
    }
    
    func hideShowButton() -> some View {
        Button {
            isSecure = !isSecure
        } label: {
            Image(isSecure ? "Eye Closed" : "Eye")
                .resizable()
                .frame(width: 30, height: 30)
        }.padding(17)
    }
    
}

struct PasswordTextfield_Previews: PreviewProvider {
    static var previews: some View {
        PasswordTextfield(password: .constant(""), placeHolder: "Enter New Password")
    }
}
