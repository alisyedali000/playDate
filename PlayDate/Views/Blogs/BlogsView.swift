//
//  BlogsView.swift
//  PlayDate
//
//  Created by عادل🫥 on 17/04/2023.
//

import SwiftUI
import SDWebImageSwiftUI
struct BlogsView: View {
    @State private var search = ""
    @State private var selectedFilterType = "Veterinary"
    @StateObject var blogVM = BlogViewModel()
    
    var category_name: String = "grooming"

    
    var body: some View {
        ZStack{
            loadView()
            
            LoaderView(isLoading: $blogVM.showLoader)
        }
        .onAppear(){
            Task{
                await blogVM.blogAPI(categoryName: category_name)
            }
        }
        
    }
}
extension BlogsView{
    
    func loadView()->some View{
        
        VStack(spacing:15){
            
            VStack(spacing:-15){
                SearchBar(search: $search, placeholder: "Search Blogs")
                FilterSelectionView(selectedFilterType: $selectedFilterType)
                
                    .padding(.horizontal)
            }
            
            Spacer()
            
            ScrollView {
                
                LazyVStack (spacing:20){
                    
                    ForEach(blogVM.blogsData) { blogsData in
                       
                            NavigationLink {
                                ReadBlogs(blog: blogsData)
                                    .hideNavigationBar
                                
                            } label: {
                            
                                CardView(blog: blogsData )
                              
                            }
                            
                        }.padding([.leading, .trailing])
                    
                }
            }
            
            
            
        }
        
        
    }
    
    
    func searchField()-> some View{
        VStack{
            CustomTextfield(placeholder: "Search Blogs", image:"search", text: $search)
            
        }.padding()
    }
}



struct BlogsView_Previews: PreviewProvider {
    static var previews: some View {

        BlogsView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
            .previewDisplayName("iPhone 14 Pro Max")
        
        BlogsView()
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
            .previewDisplayName("iPhone SE (3rd generation)")
    }
}
