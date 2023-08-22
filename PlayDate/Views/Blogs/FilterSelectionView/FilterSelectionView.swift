//
//  FilterSelectionView.swift
//  PlayDate
//
//  Created by عادل🫥 on 17/04/2023.
//

import SwiftUI

struct FilterSelectionView: View {
    @Binding var selectedFilterType: String
    
    var filters = ["Veterinary", "Grooming", "Boarding", "Training"]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(filters, id: \.self) { filter_name in
                    FilterCard(selectedFilterType: $selectedFilterType, text: filter_name)
                    
                }
            }
        }
    }
}

struct FilterSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        FilterSelectionView(selectedFilterType: .constant("Veterinary"))
    }
}

