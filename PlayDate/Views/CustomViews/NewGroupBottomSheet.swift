//
//  NewGroupBottomSheet.swift
//  PlayDate
//
//  Created by Ali Syed on 22/08/2023.
//

import SwiftUI

struct NewGroupBottomSheet:View{
    
    @State var groupName : String
    
    var body: some View{
        VStack{
            Image("Avatars")
                .padding(.top,30)
            Spacer()
            
            
            HStack{
                Text("Group Name")
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .padding()
                Spacer()
            }
            
            
            ZStack(){
                
                HStack(spacing:0){
                    
                    TextField("Whats your Group called?", text: $groupName)
                    //                    .padding(.vertical,12)
                        .padding(.horizontal,40)
                        .cornerRadius(24)
                        .textContentType(.password)
                }
                .background(
                    RoundedRectangle(cornerRadius: 24)
                        .frame(height: 46)
                        .foregroundColor(.newTFColor)
                        .padding()
                )
            }
            
            AppButton(title: "Get Started") {
                
            }.padding()
        }
    }
}

struct NewGroupBottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        NewGroupBottomSheet(groupName: "")
    }
}
