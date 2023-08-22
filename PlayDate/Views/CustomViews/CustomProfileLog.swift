//
//  CustomProfileLog.swift
//  PlayDate
//
//  Created by عادل🫥 on 17/04/2023.
//

import SwiftUI

struct CustomProfileLog: View {
     var image:String
     var Titletext: String
    var Description:String
    var color:Color
    var body: some View {
        ZStack{
            HStack(spacing:15){
                
                Image(image)
                    .resizable()
                    .frame(width: 24,height: 24)
                    .background{
                        Circle()
                            .frame(width: 40,height: 40)
                            .opacity(10)
                            .foregroundColor(color)
                            .opacity(0.1)
                        
                    }
                
                VStack(alignment:.leading,spacing:3){
                    Text(Titletext)
                        .font(.custom(DMSans.regular.rawValue, size: 13))
                        .foregroundColor(.newProfileLog)
                    Text(Description)
                        .font(.custom(DMSans.regular.rawValue, size: 11))
                        .foregroundColor(.newDescription)
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .resizable()
                    .frame(width: 8, height: 12)
                    .foregroundColor(.gray)
                
            }
        }
          
            
        
        
    }
}

struct CustomProfileLog_Previews: PreviewProvider {
    static var previews: some View {
        CustomProfileLog(image:"lock", Titletext: "Security", Description: "Manage your saved account", color:.newSecurity)
    }
}
