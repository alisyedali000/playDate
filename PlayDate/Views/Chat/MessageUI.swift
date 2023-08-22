//
//  MessageUI.swift
//  PlayDate
//
//  Created by Ali Syed on 22/08/2023.
//

import SwiftUI

struct MessageUI: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var messageText : String
    

    
    var body: some View {
        VStack{
            MessageViewTopbar(title: "Killan James", backButtonAction: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
               
            }
            
            ScrollView{
            SentMessageBubble(messageText: "Hi Misel, your welcome nice to meet you too")
            ReceivedMessageBubble(messageText: "Your dog is absolute beauty, can you send me pic?")
            }
            
  
            
            
            VStack{
                HStack{
                    
                    Text("Misellia is typing...")
                        .foregroundColor(.newCustomcolor)
                        .font(.system(size: 12))
                    Spacer()
                }.padding(.leading)
                CustomTextfield(placeholder: "Send Message", image: "galleryicon", text: $messageText).padding(.horizontal)
                
            }
            
         
        }
    }
}





struct MessageUI_Previews: PreviewProvider {
    static var previews: some View {
        MessageUI(messageText: "")
    }
}

