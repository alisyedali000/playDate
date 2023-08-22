//
//  SentMessageBubble.swift
//  PlayDate
//
//  Created by Ali Syed on 22/08/2023.
//

import SwiftUI

struct SentMessageBubble: View {
    var messageText = ""
    var body: some View{
        VStack {
            HStack{
                Spacer()
               Text(messageText)
                    .padding(15)
                    .background(Color("Customcolor"))
                    .cornerRadius(24)
                    .font(.system(size: 15))
                    .foregroundColor(Color(.white))
                    .frame(maxWidth: 280)
            }.padding(.horizontal)
            HStack{
                Spacer()
                Text("8:30")
                    .foregroundColor(Color(.lightGray))
                    .font(.system(size: 12))
            }.padding(.horizontal)
        }
    }
}

struct SentMessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        SentMessageBubble()
    }
}
