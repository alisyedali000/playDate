//
//  FilterCard.swift
//  PlayDate
//
//  Created by عادل🫥 on 17/04/2023.
//

import SwiftUI

struct FilterCard: View {
    
    @Binding var selectedFilterType: String
    var text: String
    
    var body: some View {
        loadView()
    }
}
extension FilterCard{
    func loadView()->some View{
        ZStack{
            
            Capsule()
                .frame(width: 80,height: 35)
                .foregroundColor(text == selectedFilterType ? .newBTColor : .newBBColor)
            Text(text)
                .foregroundColor(.FilterCardText)
                .font(.custom(DMSans.regular.rawValue, size: 12))
            
            
        }.onTapGesture {
            withAnimation {
                selectedFilterType = text
            }
        }
    }
}

struct FilterCard_Previews: PreviewProvider {
    static var previews: some View {
        FilterCard(selectedFilterType: .constant("Veterinary"), text: "Veterinary")
    }
}

