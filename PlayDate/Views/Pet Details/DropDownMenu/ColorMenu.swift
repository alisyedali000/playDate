//
//  DropDownMenu.swift
//  PlayDate
//
//  Created by عادل🫥 on 28/04/2023.
//

import SwiftUI

struct ColorMenu: View {
    @Binding var colorSelection :String
    let color = ["Brown", "Green", "Blue","Red","Gray"]
    
    var body: some View {
        loadView()
    }
}
extension ColorMenu{
    func loadView()->some View{
        VStack {
            
            Menu {
                ForEach(color, id: \.self) { value in
                    Button(value) {
                        colorSelection = value
                    }
                }
            } label: {
                ZStack() {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(Color.newTFColor)
                        .frame(height: 50)
                    HStack{
                        Text(colorSelection)
                            .foregroundColor(.gray)
                        Spacer()
                        Image(systemName:"chevron.down")
                            .foregroundColor(.gray)
                        
                    }.padding()
                    
                }
            }
            
            
        }
        
    }
}

struct ColorMenu_Previews: PreviewProvider {
    static var previews: some View {
        ColorMenu(colorSelection: .constant("Brown"))
    }
}
