//
//  Savedblogs.swift
//  PlayDate
//
//  Created by عادل🫥 on 18/04/2023.
//

import SwiftUI
import SDWebImageSwiftUI
struct Savedblogs: View {
    
    @Environment (\.dismiss) var dismiss
    @StateObject var savedblogVM = BlogViewModel()
    var columns = [GridItem(.flexible()),
                   GridItem(.flexible()),
                   GridItem(.flexible())]
    
    var body: some View {
        ZStack{
            loadView()
            LoaderView(isLoading: $savedblogVM.showLoader)
        }
            .onAppear{
                Task{
                    await savedblogVM.savedBlogAPI()
                }
            }
    }
}
extension Savedblogs{
    func loadView()->some View{
        
        VStack{
            
            ZStack {
                CustomNavButton(title: "Saved Blogs")
                
                
                Spacer()
            }.padding(.horizontal)
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns) {
                    ForEach(savedblogVM.savedBlogsData) { blog in
                        
                        SaveBlogCell(savedblog: blog)
                    }.padding([.leading,.trailing])
                }
            }
            
            Spacer()
        }.padding()
        
    }
}
        




struct Savedblogs_Previews: PreviewProvider {
    static var previews: some View {
        Savedblogs()
        Savedblogs()
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
            .previewDisplayName("iPhone SE (3rd generation)")
    }
}
