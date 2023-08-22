//
//  CustomSelectButton.swift
//  PlayDate
//
//  Created by عادل🫥 on 13/04/2023.
//

import SwiftUI

struct CustomSelectButton: View {
    @Binding var isSelected: Bool
    @State var color: Color
    @State var text: String
    var body: some View {
    loadView()
    }
}
extension CustomSelectButton{
    func loadView()->some View{
        ZStack{
            Capsule()
                .frame(width: 80,height: 35)
                .foregroundColor(isSelected ? color : .newBBColor)
            Text(text)
                .foregroundColor(.white)
                .font(.custom(DMSans.regular.rawValue, size: 12))
               
            
        }
    }
}

struct CustomSelectButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomSelectButton(isSelected: .constant(false), color: .newBBColor, text: "Veterinary")
    }
}
