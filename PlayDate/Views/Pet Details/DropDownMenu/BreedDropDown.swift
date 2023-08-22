//
//  BreedDropDown.swift
//  PlayDate
//
//  Created by Aadil on 24/05/2023.
//

import SwiftUI

struct BreedDropDown: View {
    @Binding var breedSelection: String
    let breed = ["Labrador Retriever", "German Shepherd", "Other"]
    var body: some View {
        loadView()
    }
}
extension BreedDropDown{
    func loadView()->some View{
        VStack {
            
            Menu {
                ForEach(breed, id: \.self) { value in
                    Button(value) {
                        breedSelection = value
                    }
                }
            } label: {
                ZStack() {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(Color.newTFColor)
                        .frame(height: 50)
                    HStack{
                        Text(breedSelection)
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

struct BreedDropDown_Previews: PreviewProvider {
    static var previews: some View {
        BreedDropDown(breedSelection: .constant("Labrador Retriever"))
    }
}
