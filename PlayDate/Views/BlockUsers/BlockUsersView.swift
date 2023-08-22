//
//  BlockUsersView.swift
//  PlayDate
//
//  Created by عادل🫥 on 19/04/2023.
//

import SwiftUI
struct BlockUsersView: View {
    @Environment (\.dismiss) var dismiss
    @State var blockusersArray = [BlockUsers(userimage: "male", username: "Claudia Maudi", blockstatus: "Blocked On 19 Feb 2023", unblock: "Unblock"),BlockUsers(userimage: "female", username: "Novita", blockstatus: "Blocked On 19 Feb 2023", unblock: "Unblock"), BlockUsers(userimage: "user3", username: "Mili Nose", blockstatus: "Blocked On 9 Feb 2023", unblock: "Unblock"), BlockUsers(userimage: "user4", username: "Ikhsan SD", blockstatus: "Blocked On 29 Feb 2023", unblock: "Unblock")]
    var body: some View {
       loadView()
    }
}
extension BlockUsersView{
    func loadView()-> some View{
      
        VStack(spacing:22){
                CustomNavButton(title: "Blocked users")
            Spacer()
            VStack(spacing:22){
                ForEach(blockusersArray){ blockusers in
                    BlockedCell(blockusers: blockusers)
                }
                Spacer()
            }
            
        }.padding()
            
            
        
    }
}

struct BlockUsersView_Previews: PreviewProvider {
    static var previews: some View {
        BlockUsersView()
        BlockUsersView()
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
            .previewDisplayName("iPhone SE (3rd generation)")
    }
}
