//
//  MyPuppy.swift
//  PlayDate
//
//  Created by عادل🫥 on 18/04/2023.
//

import SwiftUI
import SDWebImageSwiftUI
struct MyPuppy: View {
   
 @StateObject var puppyVM = AddPetViewModel()
    var puppy: AddPetModel
    init(puppy: AddPetModel){
        self.puppy = puppy
    }
    
    var body: some View {
       
            loadView()
          
            
        
    }
}
extension MyPuppy{
    func loadView()->some View{
        VStack{
            ZStack {
                CustomNavButton(title: "My Puppy")
                
            }.padding(.horizontal)
            ZStack {
                RoundedRectangle(cornerRadius:20)
                    .foregroundColor(.newprofilebackground)
                    .frame(height: 120)
                VStack{
                    HStack(){
                        let url = AppUrl.IMAGEURL + (puppy.image ?? "")
                        WebImage(url: URL(string: url))
                                .resizable()
                                .indicator(.activity)
                                .frame(width: 80,height: 80)
                                .clipShape(Circle())
                        
                        text()
                        
                        
                    }
                }
            }.padding()
            VStack{
                HStack {
                    puppyDescription(color: .newpupyColor, image: AppImages.ColorIcon.rawValue, title: puppy.colour ?? "", detail: "COLOR")
                    
                    puppyDescription(color: .newnameColor, image: AppImages.NameIcon.rawValue, title: puppy.breed ?? "", detail: "BREED")
                
                }
                HStack{
                    puppyDescription(color: .newcalenderColor, image: AppImages.Calender.rawValue, title: puppy.age ?? "", detail: "AGE")
                    
                    puppyDescription(color: .newgenderColor, image: AppImages.GenderIcon.rawValue, title: puppy.gender ?? "", detail: "GENDER")
                }
            }.padding()
            Spacer()
            
           
        }
        
    }
}


extension MyPuppy {
    
    func puppyDescription(color: Color, image: String, title: String, detail: String) -> some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(height: 185)
                .foregroundColor(color.opacity(0.2))
            
            VStack {
                Image(image)
                    .resizable()
                    .frame(width: 50, height: 50)
                
                Text(title)
                    .foregroundColor(color)
                    .font(.system(size: 20, weight: .semibold))
                
                Text(detail)
                    .foregroundColor(.gray)
            }
        }
    }
    func icon()->some View{
        HStack{
            NavigationLink {
                EditPetDetails(editDetails: puppy)
                    .hideNavigationBar
            
            }label: {
                Image(AppImages.pen.rawValue)
                    .resizable()
                    .frame(width: 30, height: 30)
            }
        }
    }
    func text()->some View{
        HStack(spacing:60){
            VStack(alignment: .leading,spacing:5){
                Text(puppy.name ?? "")
                    .foregroundColor(.newBTColor)
                    .font(.custom(DMSans.bold.rawValue, size: 35))
                Text("St. Angel’s Street 764")
                    .foregroundColor(.newDescription)
                    .font(.custom(DMSans.regular.rawValue, size: 12))
            }
            
            icon()
        }.padding()
    }
}

struct MyPuppy_Previews: PreviewProvider {
    static var previews: some View {
        MyPuppy(puppy: AddPetModel())
        MyPuppy(puppy: AddPetModel())
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
            .previewDisplayName("iPhone SE (3rd generation)")
    }
}
