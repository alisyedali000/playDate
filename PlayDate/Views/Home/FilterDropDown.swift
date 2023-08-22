//
//  FilterDropDown.swift
//  PlayDate
//
//  Created by عادل🫥 on 05/05/2023.
//

import SwiftUI

struct FilterDropDown: View {
    @State private var ageSelection = "1.3 Year"
    let age = ["1.3 Year", "2 Year", "1 Year","1.2 Year","1.5 Year"]
    var body: some View {
      loadView()
    }
}
extension FilterDropDown{
    func loadView() -> some View{
        VStack {
            
            Menu {
                ForEach(age, id: \.self) { value in
                    Button(value) {
                        ageSelection = value
                    }
                }
            } label: {
                ZStack() {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(Color.newTFColor)
                        .frame(height: 50)
                    HStack{
                        Text(ageSelection)
                            .foregroundColor(.gray)
                        Spacer()
                        Image(systemName:"chevron.down")
                            .foregroundColor(.newCustomcolor)
                        
                    }.padding()
                    
                }
            }
            
            
        }
    }
}

struct FilterDropDown_Previews: PreviewProvider {
    static var previews: some View {
        FilterDropDown()
    }
}
