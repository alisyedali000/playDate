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
            HStack(alignment: .top){
                
               Text(messageText)
                    .padding(15)
                    .background(Color("ReceivedMessageBubble"))
                    .foregroundColor(Color(.black))
                    .cornerRadius(24)
                    .font(.system(size: 15))
                    .foregroundColor(Color(.white))
                    .padding(.trailing,50)
                Spacer()
            }.padding(.horizontal)
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
        ReceivedMessageBubble(messageText: "Hello")
    }
}
