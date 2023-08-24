//
//  ProfileView.swift
//  PlayDate
//
//  Created by عادل🫥 on 17/04/2023.
//

import SwiftUI
import SDWebImageSwiftUI
import UIKit
struct ProfileView: View {
    
    @State private var moveToAddPets = false
    @Environment (\.dismiss) var dismiss
    @EnvironmentObject var google : GoogleAuthentication
    @EnvironmentObject var apple : AppleSignIn
    @StateObject var profileVM = AddPetViewModel()
    @StateObject var deleteVM = EditPetViewModel()
    @State private var showalert = false
    var body: some View {
        
        NavigationView {
            ZStack{
                loadView()
                LoaderView(isLoading: $profileVM.showLoader)
            }
                .onAppear {
                    Task {
                        await profileVM.userPetsAPI()
                    }
                }
        }
        
        
        
            .background(hiddenNavigation())
            .onReceive(UserDefaultManager.moveToProfile, perform: { newValue in
                print("move to add pets: \(newValue)")
                moveToAddPets = newValue
            })
            
        
    }
    
    func loadView()->some View{
        VStack(){
            
            ZStack {
                RoundedRectangle(cornerRadius:20)
                    .foregroundColor(.newBTColor)
                    .frame(height: 205)
                
                VStack{
                    HStack(){
                        profile()
               
                        profiletext()
                    }.frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    addprofile()
                }
            }.padding(20)
            
            profileMenu()
            Spacer()
            
        }.padding(.top)
       
        
    }
    
    
}
extension ProfileView {
    
    func profileMenu()->some View{
        VStack(spacing: 20){
            NavigationLink {
                SecurityView()
                    .hideNavigationBar
            } label: {
                CustomProfileLog(image: AppImages.security.rawValue, Titletext: "Security", Description:"Manage your saved account", color: .newSecurity)
            }
            ProfileToggle(image: AppImages.notification.rawValue, Titletext: "Notifications", Description: "Turn notifications ON/OFF", color: .newDescription)
            ProfileToggle(image: AppImages.location.rawValue, Titletext: "Hide Location", Description: "Hide your location from map", color: .newHideLocation)
            NavigationLink {
                Savedblogs()
                    .hideNavigationBar
            } label: {
                CustomProfileLog(image: AppImages.saveblog.rawValue, Titletext: "Saved Blogs", Description: "Check your saved blogs", color: .newSaveBlogs)
            }
            NavigationLink {
                BlockUsersView()
                    .hideNavigationBar
            }label: {
                CustomProfileLog(image: AppImages.blockuser.rawValue, Titletext: "Block Users", Description: "Manage blocked users", color: .newBlockUser)
            }
            
            Button {
                self.showalert.toggle()
                Task {
                    await deleteVM.deleteUserAPI()
                }
                DispatchQueue.main.async {
                    UserDefaultManager.shared.removeUser()
                }
            }
        
        
        label: {
                CustomProfileLog(image: AppImages.delete.rawValue, Titletext: "Delete Account", Description: "Delete account from here", color: .newHideLocation)
               
            } .alert(isPresented: self.$showalert) {
                Alert(title: Text("Are you sure you want to delete this Account?"),
                      primaryButton: .destructive(Text("Delete")) {
                    
                },
                      secondaryButton: .cancel())
            }

            
            
            Button {
                DispatchQueue.main.async {
                    UserDefaultManager.shared.removeUser()
                    google.signOut()
                    apple.signOut()
                }
                
            } label: {
                CustomProfileLog(image: AppImages.logout.rawValue, Titletext:"Log out" , Description: "Further secure your account for safety", color: .newLogout)
            }

        }.padding(.horizontal,20)
        
    }
    
    func profile()-> some View{
        HStack{
            Image(AppImages.profile.rawValue)
   
        }
    }
    
    func profiletext() -> some View {
        
        HStack(spacing:60) {
            
            VStack(spacing:2){
                
                Text("William Shakespeare")
                    .foregroundColor(.newProfileWilliamColor)
                    .font(.custom(DMSans.regular.rawValue, size: 16))
                Text("Shakes-appeare@gmail.com")
                    .foregroundColor(.newAColor)
                    .font(.custom(DMSans.regular.rawValue, size: 12))
                
            }
            
            Image(AppImages.camera.rawValue)
            
        }
    }
    
    func addprofile() ->some View {
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack(spacing:20){
                VStack(spacing:3){
                    
                    Button {
                        
                        self.moveToAddPets.toggle()
                    } label: {
                        VStack {
                            Image(AppImages.addprofile.rawValue)
                                .resizable()
                                .frame(width: 71, height: 71)
                               
                            
                            Text("Add New Pet")
                                .foregroundColor(.black)
                                .font(.custom(DMSans.regular.rawValue, size: 10))
                                
                        }
                    }
                    
                }
                
                
                ForEach(profileVM.petData ) { pet in
                    VStack(spacing:3){
                        NavigationLink {
                            MyPuppy(puppy: pet)
                                .hideNavigationBar
                        }label: {
                            
                            VStack{
                                let url = AppUrl.IMAGEURL + (pet.image ?? "")
                                WebImage(url: URL(string: url))
                                    .resizable()
                                    .indicator(.activity)
                                    .frame(width: 71,height: 71)
                                    .clipShape(Circle())
                                Text(pet.name ?? "")
                                    .foregroundColor(.black)
                                    .font(.custom(DMSans.regular.rawValue, size: 10))
                            }
                            
                        }
                        
                    }
                }
            
            }.padding()
                
        }
        
        
    }

    
    func hiddenNavigation() -> some View {
        
        ZStack {
            NavigationLink("", destination: AddPetDetails().hideNavigationBar, isActive: $moveToAddPets)
        }
    }
}



struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
        
 
    }
}
