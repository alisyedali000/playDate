//
//  ChatView.swift
//  PlayDate
//
//  Created by عادل🫥 on 01/05/2023.
//

import SwiftUI

struct ChatView: View {
    @State private var search = ""
    @State var chatArray = [UserChat(chatProfile: "male", userName: "Claudia Maudi", chat: "Active Today", chatImage: "galleryicon"),UserChat(chatProfile: "male", userName: "Claudia Maudi", chat: "Active Today", chatImage: "galleryicon"),UserChat(chatProfile: "male", userName: "Claudia Maudi", chat: "Active Today", chatImage: "galleryicon"),UserChat(chatProfile: "male", userName: "Claudia Maudi", chat: "Active Today", chatImage: "galleryicon"),UserChat(chatProfile: "male", userName: "Claudia Maudi", chat: "Active Today", chatImage: "galleryicon"),UserChat(chatProfile: "male", userName: "Claudia Maudi", chat: "Active Today", chatImage: "galleryicon"),UserChat(chatProfile: "male", userName: "Claudia Maudi", chat: "Active Today", chatImage: "galleryicon"),UserChat(chatProfile: "male", userName: "Claudia Maudi", chat: "Active Today", chatImage: "galleryicon"),UserChat(chatProfile: "male", userName: "Claudia Maudi", chat: "Active Today", chatImage: "galleryicon"),UserChat(chatProfile: "male", userName: "Claudia Maudi", chat: "Active Today", chatImage: "galleryicon"),UserChat(chatProfile: "male", userName: "Claudia Maudi", chat: "Active Today", chatImage: "galleryicon")
    ]
    
    
    var body: some View {
        NavigationView{
            VStack{
    
            HStack{
                CustomSearchField(placeholder: "Search chat...", text: $search)
                Button(action:{
                }){
                    Image("menudots")
                        .frame(width: 18, height: 4)
                }
            }.padding()
            
            
            ZStack(alignment:.init(horizontal: .trailing, vertical: .bottom)){
                
                
             
                
                ScrollView {
                    VStack(spacing: 22) {
                        ForEach(chatArray) { userchat in
                            NavigationLink(destination: MessageUI(messageText: userchat.chat)) {
                                ChatCell(userchat: userchat)
                            }
                        }
                    }
                    .padding()
                }

                NavigationLink(destination: GroupChatView()) {
                    creategroupIcon()
                        .padding(.trailing, 20)
                        .padding(.bottom, 28)
                }
            }
            
            
        }
            
        }
    }
}
func creategroupIcon() -> some View{
    ZStack{
        
        Circle()
            .frame(height: 52)
            .foregroundColor(.newLCColor)
        Image("chatLike")
            .frame(width: 40,height: 40)
        
        
        
    }
}


struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
        ChatView()
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
            .previewDisplayName("iPhone SE (3rd generation)")
    }
}
