//
//  GroupViewTopbar.swift
//  PlayDate
//
//  Created by Ali Syed on 22/08/2023.
//

import SwiftUI

struct CustomTopbar: View {
        
        var nextButtonTitle: String
        var title : String
        var backButtonAction: () -> Void
        var nextButtonAction: () -> Void
        
        var body: some View{
            HStack{
                Button{
                    backButtonAction()
                }label: {
                    Image(systemName: "chevron.backward")
                        .foregroundColor(.newCustomcolor)
                       
                }
                Spacer()
                
                Text(title)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                Spacer()
                
                Button{
                    nextButtonAction()
                }label: {
                    Text(nextButtonTitle)
                        .foregroundColor(.newCustomcolor)
                }
            }.padding()
            
            
        }
    
}

struct GroupViewTopbar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTopbar(nextButtonTitle: "Next", title: "New Group Chat", backButtonAction: {
           
        }) {
           
        }
    }
}
