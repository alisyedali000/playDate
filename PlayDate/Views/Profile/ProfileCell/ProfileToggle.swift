//
//  ProfileToggle.swift
//  PlayDate
//
//  Created by عادل🫥 on 18/04/2023.
//

import SwiftUI

struct ProfileToggle: View {
    var image:String
    var Titletext: String
   var Description:String
   var color:Color
    @State private var Showresult: Bool = true
    var body: some View {
        loadView()
    }
}
extension ProfileToggle{
    func loadView()->some View{
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
            }
        
            Toggle("", isOn: $Showresult)
                .toggleStyle(SwitchToggleStyle(tint: .newCustomcolor))
                
              
        }
        
    }
        
}

struct ProfileToggle_Previews: PreviewProvider {
    static var previews: some View {
        ProfileToggle(image: "Notification", Titletext: "Notifications", Description: "Turn notifications ON/OFF", color: .newDescription)
    }
}
