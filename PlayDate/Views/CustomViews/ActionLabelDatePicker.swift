//
//  ActionLabelTextField.swift
//  PlayDate
//
//  Created by Aadil on 10/05/2023.
//

import SwiftUI

struct ActionLabelDatePicker: View {
  
    @FocusState var isFocused: Bool
    var title: String
    var action: () -> Void
    
    init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
    
    var body: some View {
        ZStack{
            loadView()
        }
    }
}
extension DateFormatter{
    public enum Style: UInt{
        case none = 0
        case short = 1
        case medium = 2
        case long = 3
        case full = 4
       
    }
}
extension ActionLabelDatePicker{
    func loadView() -> some View{
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.newTFColor)
                    .frame(height: 50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(isFocused ? Color(.blue) :
                                    .newTFColor , lineWidth: 0)
                    )
                
                HStack {
                    Text("\(title)")
                        .foregroundColor(.black)
                    
                    
                    Spacer()
                    
                    Image(AppImages.date.rawValue)
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.newTFColor)
                }.padding(.horizontal)
            }
        }
    }
}

struct ActionLabelDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        ActionLabelDatePicker(title: "", action: {})
    }
}
