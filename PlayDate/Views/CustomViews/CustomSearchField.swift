//
//  CustomSearchField.swift
//  PlayDate
//
//  Created by عادل🫥 on 03/05/2023.
//

import SwiftUI

struct CustomSearchField: View {
    var placeholder: String
    @Binding var text: String
    var body: some View {
       loadView()
    }
}
extension CustomSearchField{
    func loadView() -> some View{
        ZStack(){
            
            HStack(spacing:0){
                Image("search")
                    .resizable()
                    .foregroundColor(.newTFColor)
                    .frame(width: 14, height: 14)
                TextField(placeholder, text: $text)
//                    .padding(.vertical,12)
                    .padding(.horizontal)
                    .cornerRadius(24)
                    .textContentType(.password)
            }.padding(.horizontal,20)
                .background(
            RoundedRectangle(cornerRadius: 24)
                .frame(height: 46)
                .foregroundColor(.newTFColor)
            )
        }
    }
}

struct CustomSearchField_Previews: PreviewProvider {
    static var previews: some View {
        CustomSearchField(placeholder: "Search Chat...", text: .constant(""))
    }
}
