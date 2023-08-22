//
//  SkillButton.swift
//  Unified
//
//  Created by Qazi Ammar Arshad on 15/07/2022.
//

import SwiftUI

struct InterestButton: View {

    var title = ""
    var showCross: Bool
    var action: () -> Void

    var body: some View {
        
        HStack {
            
            Text(title)
                .lineLimit(1)
                .font(.custom(DMSans.medium.rawValue, size: 12))
                .foregroundColor(.newBTColor)
                .padding(.horizontal, 10)
                .padding(.vertical, 5)
            
            if showCross {
                Button {
                    self.action()
                } label: {
                    
                    Image(systemName: "multiply.circle.fill")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .padding(10)
                        .foregroundColor(.newBTColor)
                }
            }
        }.background(
            RoundedRectangle(cornerRadius: 54)
                .foregroundColor(.newtagColor)
                
        )
    }
}

struct SkillButton_Previews: PreviewProvider {
    static var previews: some View {
        InterestButton(title: "Traveling", showCross: true) {
            print("pasa")
        }
    }
}
