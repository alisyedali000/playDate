//
//  GroupSettingUI.swift
//  PlayDate
//
//  Created by Ali Syed on 22/08/2023.
//

import SwiftUI

struct GroupSettingUI: View {
    
    @State var chatArray = [UserChat(chatProfile: "male", userName: "Claudia Maudi", chat: "You", chatImage: ""),UserChat(chatProfile: "male", userName: "Claudia Maudi", chat: "Active Today", chatImage: "trash"),UserChat(chatProfile: "male", userName: "trash", chat: "Active Today", chatImage: "trash"),UserChat(chatProfile: "male", userName: "Claudia Maudi", chat: "Active Today", chatImage: "trash"),UserChat(chatProfile: "male", userName: "Claudia Maudi", chat: "Active Today", chatImage: "trash"),UserChat(chatProfile: "male", userName: "Claudia Maudi", chat: "Active Today", chatImage: "trash"),
    ]
    
    var groupName : String
    var body: some View {
        VStack{
            
            VStack{
                CustomTopbar(nextButtonTitle: "", title: "Group Settings") {
                    
                } nextButtonAction: {
                    
                }
                
                VStack{
                    Image("Avatars")
                        .frame(width: 78, height: 78)
                    HStack {
                        Text("Dog Lovers")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                        Image("Pen")
                    }
                    
                    HStack{
                        
                        Text("5 participant")
                            .font(.system(size: 14))
                        Spacer()
                        Image("userplus")
                    }.padding(.horizontal)
                    
                    ScrollView{
                        ForEach(chatArray){ userchat in
                            ChatCell(userchat:userchat)
                        }
                        HStack{
                            Image("arrowaction")
                            Text("Exit Group")
                                .font(.system(size: 14))
                            Spacer()
                        }.padding()
                    }.padding(.horizontal)
                    
                    
                    Spacer()
                }
            }
        }
    }
}

struct GroupSettingUI_Previews: PreviewProvider {
    static var previews: some View {
        GroupSettingUI(groupName: "DogLovers")
    }
}
