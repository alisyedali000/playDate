//
//  CardSwipePlayDate.swift
//  PlayDate
//
//  Created by عادل🫥 on 01/05/2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject var homeData = HomeViewModel()
    @State private var showSheet: Bool = false
    var body: some View {
        ZStack{
            loadView()
            LoaderView(isLoading: $homeData.showLoader)
        } .onAppear {
            Task{
                await homeData.swipeCardAPI(age: "", breed: "", interests: [""])
            }
        }
    }
}
extension HomeView{
    func loadView() -> some View{
        VStack{
            searchDetails()
            
            ZStack {
                if let users = homeData.fetched_users{
                    ForEach(users.reversed()){ user in
                        SwipeCard(user: user)
                            .environmentObject(homeData)
                    
                    }
                }
            }
            Spacer()
            
        }.padding()
        
    }
}
extension HomeView{
    func searchDetails()->some View{
        
        HStack(){
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .frame(width: 37, height: 37)
            VStack(alignment:.leading){
                Text("Welcome")
                    .foregroundColor(Color.newDescription)
                    .font(.custom(DMSans.bold.rawValue, size: 13))
                Text("William Shakespeare")
                    .foregroundColor(Color.newWColor)
                    .font(.custom(DMSans.bold.rawValue, size: 13))
            }
            HStack{
                Image(systemName: "hands.sparkles.fill")
                    .foregroundColor(.yellow)
                    .frame(width: 18, height: 18)
                Spacer()
                
                Button {
                    showSheet.toggle()
                } label: {
                    Image("Filter")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                .sheet(isPresented: $showSheet, content: {
                    BottomSheetView()
                        .presentationDetents([.medium])
                        .frame(height: UIScreen.main.bounds.height/2)
                        .background(Color.white)
                        .cornerRadius(20)
                    
                })
            }.padding()
        }
    }
}
struct BottomSheetView: View {
   
    @State private var interest = ""
    var body: some View {
        VStack {
            VStack(alignment:.leading,spacing: 10){
                Text("Age")
                    .foregroundColor(.black)
                    .font(.custom(DMSans.regular.rawValue, size: 14))
                FilterDropDown()
            }
            VStack(alignment:.leading,spacing: 10){
                Text("Breed")
                    .foregroundColor(.black)
                    .font(.custom(DMSans.regular.rawValue, size: 14))
                    FilterDropDown()
            }
            VStack(alignment:.leading,spacing: 10){
                Text("Interests")
                    .foregroundColor(.black)
                    .font(.custom(DMSans.regular.rawValue, size: 14))
                CustomTextfield(placeholder: "Catching ball", image: "", text: $interest)
            }
            Spacer()
            CustomButtonView(text:"Apply Filter")
        }.padding()
    }
}

struct CardSwipePlayDate_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
        HomeView()
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
            .previewDisplayName("iPhone SE (3rd generation)")
    }
}
