//
//  BlockedUsers.swift
//  PlayDate
//
//  Created by عادل🫥 on 19/04/2023.
//

import SwiftUI

struct BlockedCell: View {
    @State private var showalert = false
    var blockusers: BlockUsers
    var body: some View {
        loadView()
    }
}
extension BlockedCell{
    func loadView()->some View{
        VStack(){
            HStack(spacing: 15){
                Image(blockusers.userimage)
                    .resizable()
                    .frame(width: 49, height: 49)
                    .clipShape(Circle())
                VStack(alignment:.leading,spacing: 5){
                    Text(blockusers.username)
                        .foregroundColor(.black)
                        .font(.custom(DMSans.regular.rawValue, size: 14))
                    Text(blockusers.blockstatus)
                        .foregroundColor(.newDateColor)
                        .font(.custom(DMSans.regular.rawValue, size: 14))
                }
                Spacer()
                
                Button(action: {
                    self.showalert.toggle()
                }) {
                    Text(blockusers.unblock)
                        .foregroundColor(.newBTColor)
                        .font(.custom(DMSans.bold.rawValue, size: 14))
                }
                .alert(isPresented: self.$showalert) {
                    Alert(title: Text("Are you sure you want to unblock this?"),
                          primaryButton: .destructive(Text("Unblock")) {
                        
                    },
                          secondaryButton: .cancel())
                }
                
                
            }
        }
        
    }
}



struct BlockedCell_Previews: PreviewProvider {
    static var previews: some View {
        BlockedCell(blockusers: BlockUsers(userimage: "male", username: "Claudia Maudi", blockstatus: "Blocked On 24 Feb 2023", unblock: "Unblock"))
    }
}
