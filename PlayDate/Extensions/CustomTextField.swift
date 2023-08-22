//
//  CustomTextField.swift
//  BWR Covid-19 Test
//
//  Created by Ammar on 2/5/22.
//

import SwiftUI

struct CustomTextField: View {
    
    var title = ""
    @FocusState var isFocused: Bool
    @State private var editing = false
    var placeHolder = String()
    @Binding var text: String
    var isSecure = false
    var background: Color = .newTFColor
    
    var body: some View {
        Group {
            isSecure ? AnyView(secureTF()) : AnyView( normalTF())
        }
        
    }
    
    func secureTF() -> some View {
        SecureField(placeHolder, text: $text)
            .font(.custom(DMSans.regular.rawValue, size: 14))
            .focused($isFocused)
            .padding(20)
            .background(background)
            .cornerRadius(24)
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(isFocused ? Color(.blue) :
                            .gray , lineWidth: 0)
            )
    }
    
    func normalTF() -> some View {
        TextField(placeHolder, text: $text)
            .font(.custom(DMSans.regular.rawValue, size: 14))
            .padding(20)
            .focused($isFocused)
        
            .background(background)
            .cornerRadius(24)
            .overlay(
                RoundedRectangle(cornerRadius: 24)
                    .stroke(isFocused ? Color(.blue) :
                            .gray.opacity(0.7) , lineWidth: 0)
            )
    }
    
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(text: .constant(""))
    }
}
