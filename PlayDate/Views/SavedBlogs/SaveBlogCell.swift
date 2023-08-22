//
//  SaveBlogCell.swift
//  PlayDate
//
//  Created by عادل🫥 on 19/04/2023.
//

import SwiftUI
import SDWebImageSwiftUI
struct SaveBlogCell: View {
    var savedblog : SavedBlogsModel?
  
    var body: some View {
       loadView()
    }
}
extension SaveBlogCell{
    func loadView()->some View{
        VStack{
            VStack{
                let url = AppUrl.IMAGEURL + (savedblog?.blog_id.blogImage ?? "")
                
                WebImage(url: URL(string: url))
                    .resizable()
                    .indicator(.activity)
                    .frame(height: 152)
                    .cornerRadius(12)
                Text(savedblog?.blog_id.title ?? "" )
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.black)
                    .font(.custom(DMSans.bold.rawValue, size: 10))
            }
            HStack(){
                
                Text(savedblog?.blog_id.createdAt ?? "")
                        .foregroundColor(.newDateColor)
                        .font(.custom(DMSans.regular.rawValue, size: 7.5))
                Button {
                        
                } label: {
                    Image("unsave")
                        .resizable()
                        .frame(width: 11, height: 11)

                
                }
                
            }
        
        }
    }
}




struct SaveBlogCell_Previews: PreviewProvider {
    static var previews: some View {
        SaveBlogCell(savedblog: SavedBlogsModel(id: 1, user_id: "2", blog_id: BlogDetails()))
    }
}
