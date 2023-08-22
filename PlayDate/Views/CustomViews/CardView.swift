//
//  CardView.swift
//  PlayDate
//
//  Created by عادل🫥 on 17/04/2023.
//

import SwiftUI
import SDWebImageSwiftUI
struct CardView: View {
    var blog: BlogDetails?
    var body: some View {
       loadView()
    }
}
extension CardView{
    func loadView()->some View{
        VStack (spacing:14){
            
            let url = AppUrl.IMAGEURL + (blog?.blogImage ?? "")

            WebImage(url: URL(string: url))
                .resizable()
                .indicator(.activity)
                .frame(height: 216)
                .cornerRadius(15)
                
            VStack(alignment:.leading, spacing: 5) {
                Text(blog?.title ?? "")
                    .font(.custom(DMSans.bold.rawValue, size: 14))
                    .foregroundColor(.newTitleColor)
                Text(blog?.content ?? "")
                    .lineLimit(3)
                        .multilineTextAlignment(.leading)
                        .font(.custom(DMSans.regular.rawValue, size: 12))
                        .foregroundColor(.newCCOLOR)
                
                
                HStack(){
                    HStack(spacing:70){
                        HStack(spacing:1){
                            Text("Author:")
                                .font(.custom(DMSans.regular.rawValue, size: 12))
                                .foregroundColor(.black)
                            Text(blog?.authorName ?? "")
                                .font(.custom(DMSans.regular.rawValue, size: 12))
                                .foregroundColor(.newAColor)
                        }
                        Text(blog?.createdAt ?? "0" )
                            .font(.custom(DMSans.regular.rawValue, size: 12))
                            .foregroundColor(.newAColor)
                    }
                    
                }
            }.padding()
            
            
        }
        .background {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.white)
                .shadow(radius: 1.5)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}


