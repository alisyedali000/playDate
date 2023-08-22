//
//  GroupChatView.swift
//  PlayDate
//
//  Created by Ali Syed on 22/08/2023.
//

import SwiftUI

struct GroupChatView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var isBottomSheetPresented = false
    
    @State private var search = ""
    @State var chatArray = [UserChat(chatProfile: "male", userName: "Claudia Maudi", chat: "Active Today", chatImage: "ChatSelected"),UserChat(chatProfile: "male", userName: "Claudia Maudi", chat: "Active Today", chatImage: "ChatSelected"),UserChat(chatProfile: "male", userName: "Claudia Maudi", chat: "Active Today", chatImage: "ChatUnselected"),UserChat(chatProfile: "male", userName: "Claudia Maudi", chat: "Active Today", chatImage: "ChatUnselected"),UserChat(chatProfile: "male", userName: "Claudia Maudi", chat: "Active Today", chatImage: "ChatUnselected"),UserChat(chatProfile: "male", userName: "Claudia Maudi", chat: "Active Today", chatImage: "ChatUnselected"),UserChat(chatProfile: "male", userName: "Claudia Maudi", chat: "Active Today", chatImage: "ChatUnselected"),UserChat(chatProfile: "male", userName: "Claudia Maudi", chat: "Active Today", chatImage: "ChatUnselected"),UserChat(chatProfile: "male", userName: "Claudia Maudi", chat: "Active Today", chatImage: "ChatUnselected"),UserChat(chatProfile: "male", userName: "Claudia Maudi", chat: "Active Today", chatImage: "ChatUnselected"),UserChat(chatProfile: "male", userName: "Claudia Maudi", chat: "Active Today", chatImage: "ChatUnselected")
    ]
    var body: some View {
        NavigationView{
            VStack{
                
                CustomTopbar(nextButtonTitle: "Next", title: "New Group Chat", backButtonAction: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    isBottomSheetPresented.toggle()
                }
                .sheet(isPresented: $isBottomSheetPresented) {
                    NewGroupBottomSheet(groupName: "")
                        .padding()
                        .presentationDetents([.height(355)])
                        .presentationDragIndicator(.hidden)
                    
                }
                
                
                
                HStack{
                    Text("To")
                        .font(.system(size: 16))
                    Spacer()
                }.padding()
                ZStack(alignment:.init(horizontal: .trailing, vertical: .bottom)){
                    
                    VStack(spacing:22){
                        HStack{
                            CustomSearchField(placeholder: "Search chat...", text: $search)
                            Button(action:{
                            }){
                                Image("menudots")
                                    .frame(width: 18, height: 4)
                            }
                        }.padding(.horizontal)
                        ScrollView{
                            
                            HStack{
                                Text("Suggested")
                                    .font(.system(size: 16))
                                    .fontWeight(.bold)
                                Spacer()
                            }.padding(.vertical)
                            ForEach(chatArray){ userchat in
                                ChatCell(userchat:userchat)
                            }
                        }.padding(.horizontal)
                    }
                    
                }
                
            }
        }.navigationBarHidden(true)
    }
}


struct GroupChatView_Previews: PreviewProvider {
    static var previews: some View {
        GroupChatView()
    }
}
