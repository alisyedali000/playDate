//
//  ReceivedMessageBubble.swift
//  PlayDate
//
//  Created by Ali Syed on 22/08/2023.
//

import SwiftUI

struct ReceivedMessageBubble:View{
    var messageText = ""
    var body: some View{
        VStack {
            HStack{
                
               Text(messageText)
                    .padding(15)
                    .background(Color("ReceivedMessageBubble"))
                    .foregroundColor(Color(.black))
                    .cornerRadius(24)
                    .font(.system(size: 15))
                    .foregroundColor(Color(.white))
                    .frame(maxWidth: 280)
                Spacer()
            }.padding(.trailing)
            HStack{
                
                Text("8:30")
                    .foregroundColor(Color(.lightGray))
                    .font(.system(size: 12))
                Spacer()
            }.padding(.horizontal)
         
        }
    }
}
struct ReceivedMessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        ReceivedMessageBubble()
    }
}
