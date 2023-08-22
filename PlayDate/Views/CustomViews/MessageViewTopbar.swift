//
//  MessageViewTopbar.swift
//  PlayDate
//
//  Created by Ali Syed on 22/08/2023.
//

import SwiftUI

struct MessageViewTopbar: View {
    
    var title: String = ""

    var backButtonAction: () -> Void
    var nextButtonAction: () -> Void
    
    var body: some View{
        VStack{
         
            HStack{
                Button{
                    backButtonAction()
                }label: {
                    Image(systemName: "chevron.backward")
                        .foregroundColor(.newCustomcolor)
                    
                }
                Spacer()
                
                HStack{
                    Image("userAvatar")
                        .frame(width: 50,height: 50)
                        .padding(.leading)
                    VStack(alignment: .leading) {
                        Text(title)
                            .font(.system(size: 16))
                        Text("Active Now")
                            .font(.system(size: 16))
                            .foregroundColor(.newDescription)
                        
                    }
                    Spacer()
                }
                
                Spacer()
                
                Button{
                    nextButtonAction()
                }label: {
                    Image("menudots")
                        .foregroundColor(.newCustomcolor)
                }
            }.padding(.horizontal)
            
            HStack{
                Rectangle()
                    .foregroundColor(.newLineColor)
                    .frame(width: 200,height: 1)
                    .padding(.leading,35)
                Spacer()
            }
           
            
        }
        
        
    }
}


struct MessageViewTopbar_Previews: PreviewProvider {
    static var previews: some View {
        MessageViewTopbar(title: "Killan James", backButtonAction: {
            
        }) {
            
        }
        
    }
}
