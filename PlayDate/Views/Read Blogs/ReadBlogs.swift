//
//  ReadBlogs.swift
//  PlayDate
//
//  Created by عادل🫥 on 17/04/2023.
//

import SwiftUI
import SDWebImageSwiftUI
struct ReadBlogs: View {
    @Environment (\.dismiss) var dismiss
    @StateObject var vm = ReadBlogModel()
    var blog: BlogDetails?
    
    init(blog: BlogDetails) {
        self.blog = blog
    }
    
    var body: some View {
        ZStack{
            loadView()
            LoaderView(isLoading: $vm.showLoader)
        }
    }
}
extension ReadBlogs{
    func loadView()->some View{
        ZStack(alignment: .top) {
           
            GeometryReader { geo in
               
                    blogimage(geo: geo)
                        .frame(height: geo.size.height * 0.65)
                   
                    
                
                    ScrollView {
                        Rectangle().frame(height: geo.size.height * 0.65)
                            .foregroundColor(.clear)
                        VStack{
                            HStack(){
                                
                                credentials()
                                Spacer()
                                postbutton()
                            }.padding()
                            readtext()
                               
                            
                        }.padding(16)
                        .background(Rectangle().foregroundColor(.white))
                    }
            }.edgesIgnoringSafeArea(.all)
            ZStack{

                navigationBack(title: blog?.categoryName ?? "")
            }.padding(.horizontal)
            
            Spacer()
                
        }
        .onAppear{
            Task{
                await vm.readBlogAPI(categoryName:blog?.categoryName ?? "")
            }
        }
        
        
    }
  
}
extension ReadBlogs{
    
    func postbutton()->some View{
        HStack(spacing:10){
            VStack{
                Button {
                    
                } label: {
                    CustomTabBarButton(img: "B1")
                }
                Text(blog?.likes ?? "")
                    .foregroundColor(.newDateColor)
                    .font(.custom(DMSans.bold.rawValue, size: 7.5))
            }
            VStack{
                Button {
                    Task{
                        await vm.saveblogAPI(blogID: String(blog?.id ?? 0))
                    }
                } label: {
                    CustomTabBarButton(img: "save")
                }
                Text(blog?.saved ?? "")
                    .foregroundColor(.newDateColor)
                    .font(.custom(DMSans.bold.rawValue, size: 7.5))
            }
            VStack{
                Button {
                
                } label: {
                    CustomTabBarButton(img: "next")
                }
                Text(blog?.share ?? "")
                    .foregroundColor(.newDateColor)
                    .font(.custom(DMSans.bold.rawValue, size: 7.5))
            }
        }
    }
    func readtext()-> some View{
        VStack(spacing:20){
            
            Text(blog?.title ?? "")
                .multilineTextAlignment(.leading)
                .font(.custom(DMSans.bold.rawValue, size: 17))
                .foregroundColor(.newGBColor)
            
            Text(blog?.content ?? "")
                .multilineTextAlignment(.leading)
                .font(.custom(DMSans.regular.rawValue, size: 12))
                .foregroundColor(.newCCOLOR)
        }.padding(.trailing)
        
    }
  
    func blogimage(geo: GeometryProxy)->some View{
      
            let url = AppUrl.IMAGEURL + (blog?.blogImage ?? "")
            return WebImage(url: URL(string: url))
                .resizable()
                .frame(height: geo.size.height * 0.65)
                .aspectRatio( contentMode: .fill)
                .clipped()
           
        
        
    }
    func credentials()->some View{
        HStack(spacing:7){
            let url = AppUrl.IMAGEURL + (blog?.authorImage ?? "")
             WebImage(url: URL(string: url))
                .resizable()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            VStack(alignment:.leading){
                Text(blog?.authorName ?? "")
                    .foregroundColor(.newWColor)
                    .font(.custom(DMSans.bold.rawValue, size: 15))
                
                Text(blog?.createdAt ?? "")
                    .font(.custom(DMSans.regular.rawValue, size: 12))
                    .foregroundColor(.newDateColor)
            }
            
        
        }
        
    }
}
extension ReadBlogs{
    
    func navigationBack(title: String) -> some View{
        VStack{
            ZStack {
                HStack {
                    
                    Button(action:{
                        self.dismiss()
                    })
                    {
                        
                        Image(systemName: "chevron.backward")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 8, height: 16)
                            .font(.system(size: 50, weight: .bold))
                    }
                    
                    Spacer()
                }
                
                Text(title)
                    .foregroundColor(.white)
                    .font(.custom(DMSans.bold.rawValue, size: 20))
            }
        }
    }
}

struct ReadBlogs_Previews: PreviewProvider {
    static var previews: some View {
        ReadBlogs(blog: BlogDetails() )
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
            .previewDisplayName("iPhone 14 Pro Max")
        ReadBlogs(blog: BlogDetails())
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
            .previewDisplayName("iPhone SE (3rd generation)")
        
    }
}

