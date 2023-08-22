//
//  CustomTabBarButton.swift
//  PlayDate
//
//  Created by عادل🫥 on 13/04/2023.
//

import SwiftUI

struct CustomTabBarButton: View {
    var img : String
    var body: some View {
        loadView()
    }
}
extension CustomTabBarButton{
    func loadView()->some View{
       
                VStack{
                    Image(img)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30,height: 30)
                }
    }
}


struct CustomTabBarButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBarButton(img: "Inbox")
    }
}
