//
//  ChatCell.swift
//  PlayDate
//
//  Created by عادل🫥 on 03/05/2023.
//

import SwiftUI

struct ChatCell: View {
    var userchat: UserChat
    var body: some View {
        loadView()
    }
}
extension ChatCell{
    func loadView() -> some View{
        VStack{
            HStack(spacing: 15){
                Image(userchat.chatProfile)
                    .resizable()
                    .frame(width: 49, height: 49)
                    .clipShape(Circle())
                VStack(alignment:.leading,spacing: 5){
                    Text(userchat.userName)
                        .foregroundColor(.black)
                        .font(.custom(DMSans.regular.rawValue, size: 14))
                    Text(userchat.chat)
                        .foregroundColor(.newDateColor)
                        .font(.custom(DMSans.regular.rawValue, size: 14))
                }
                Spacer()
                Image(userchat.chatImage)
                    .resizable()
                    .frame(width: 30, height: 30)
            }
        }
    }
}

struct ChatCell_Previews: PreviewProvider {
    static var previews: some View {
        ChatCell(userchat: UserChat(chatProfile: "male", userName: "Claudia Maudi", chat: "Active Today", chatImage: "galleryicon"))
    }
}
