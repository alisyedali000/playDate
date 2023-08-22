//
//  DropDownMenu.swift
//  PlayDate
//
//  Created by عادل🫥 on 28/04/2023.
//

import SwiftUI

struct DropDownMenu: View {
    @Binding var genderSelection: String
    let gender = ["Male", "Female", "Other"]
    var body: some View {
        loadView()
    }
}
extension DropDownMenu{
    func loadView()->some View{
        VStack {
            
            Menu {
                ForEach(gender, id: \.self) { value in
                    Button(value) {
                        genderSelection = value
                    }
                }
            } label: {
                ZStack() {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(Color.newTFColor)
                        .frame(height: 50)
                    HStack{
                        Text(genderSelection)
                            .foregroundColor(.gray)
                        Spacer()
                        Image(systemName: "chevron.down")
                            .foregroundColor(.gray)
                        
                    }.padding()
                    
                }
            }
            
            
        }
        
    }
}

struct DropDownMenu_Previews: PreviewProvider {
    static var previews: some View {
        DropDownMenu(genderSelection: .constant("Male"))
    }
}
