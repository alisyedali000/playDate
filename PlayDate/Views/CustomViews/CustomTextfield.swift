//
//  CustomTextfield.swift
//  PlayDate
//
//  Created by عادل🫥 on 07/04/2023.
//

import SwiftUI

struct CustomTextfield: View {
    
    var placeholder: String
    var image: String
    var title: String?
    @Binding var text: String
    @FocusState var isFocused: Bool
    var body: some View {
        loadView()
    }
}

extension CustomTextfield {
    
    func loadView() -> some View {
        
        VStack(alignment: .leading) {
            
            if title != "" {
                Text(title ?? "")
                    .foregroundColor(.black)
                    .font(.custom(DMSans.regular.rawValue, size: 14))
            }
            
            ZStack(alignment:.trailing){
                TextField(placeholder, text: $text)
                    .font(.custom(DMSans.regular.rawValue, size: 14))
                    .padding(20)
                    .focused($isFocused)
                    .background(Color.newTFColor)
                    .cornerRadius(24)
                    .keyboardType(.emailAddress)
                    .overlay(
                        RoundedRectangle(cornerRadius: 24)
                            .stroke(isFocused ? .gray.opacity(0.7) :
                                    .gray.opacity(0) , lineWidth: 0)
                    )
                
                
                Button{
                    
                }label:{
                    Image(image)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(.trailing)

                }
                
                
            }
            
        }
    }
}

struct CustomTextfield_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextfield(placeholder: "Enter Your Email", image: "Letter", title: "Age", text: .constant(""))
    }
}
