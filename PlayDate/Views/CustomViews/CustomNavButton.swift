//
//  CustomNavButton.swift
//  PlayDate
//
//  Created by عادل🫥 on 01/05/2023.
//

import SwiftUI

struct CustomNavButton: View {
    @Environment (\.dismiss) var dismiss
    var title:String
    
    var body: some View {
       loadView()
    }
}
extension CustomNavButton{
    func loadView()->some View{
        VStack{
            ZStack {
                HStack {
                    
                    Button(action:{
                        self.dismiss()
                    })
                    {
                        Image(systemName: "chevron.backward")
                            .resizable()
                            .foregroundColor(.blue)
                            .frame(width: 8, height: 16)
                            .font(.system(size: 50, weight: .bold))
                    }
                    
                    Spacer()
                }
                
                Text(title)
                    .foregroundColor(.black)
                    .font(.custom(DMSans.bold.rawValue, size: 20))
            }
        }
    }
}

struct CustomNavButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomNavButton(title: "Blocked users")
    }
}
