//
//  CustomButtonView.swift
//  PlayDate
//
//  Created by عادل🫥 on 11/04/2023.
//

import SwiftUI

struct CustomButtonView: View {
    @State  var text = ""
    var body: some View {
       loadView()
    }
}
extension CustomButtonView{
  
    func loadView()-> some View{
        ZStack {
            
            Image("buttonImage")
                .resizable()
                .frame(height: 60)
            
            
            Text(text)
                .foregroundColor(.white)
                .font(.custom(DMSans.bold.rawValue, size: 20))
               
        }
    }
}

struct CustomButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CustomButtonView(text: "Send OTP")
    }
}
