//
//  searchBar.swift
//  PlayDate
//
//  Created by Aadil on 06/06/2023.
//

import SwiftUI

struct SearchBar: View {
    @Binding var search: String
    var placeholder: String
    var body: some View {
       loadView()
    }
}
extension SearchBar{
    func loadView() -> some View{
        VStack{
            ZStack(){
                
                HStack(spacing: -5){
                    Image("search")
                        .resizable()
                        .foregroundColor(.newTFColor)
                        .frame(width: 14, height: 14)
                    TextField(placeholder, text: $search)
                        .padding(.vertical,20)
                        .padding(.horizontal)
                        .frame(height: 46)
                    
                }.padding(20)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .frame(height: 46)
                            .foregroundColor(.newTFColor)
                    )
            }
        }.padding(16)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(search: .constant(""), placeholder: "Search Blogs")
    }
}
