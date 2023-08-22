import SwiftUI

struct TabBarControllerView: View {
    
    @State private var tabSelection = 2
    
    init() {
        
        UITabBar.appearance().backgroundColor = .white
        UITabBar.appearance().unselectedItemTintColor = .black
        
    }
    
    var body: some View {
        
        TabView(selection: $tabSelection) {
            
            BlogsView()
                .tabItem {
                    
                    withAnimation(.linear(duration: 0.5)) {
                        Label("", image: tabSelection == 0 ? AppImages.selectedBlog.rawValue : AppImages.unselectedBlog.rawValue)
                    }
                    
                }
                .tag(0)
            
            MapView(searchLocation: .constant(""))
                .tabItem {
                    withAnimation(.linear(duration: 0.5)) {
                        
                        Label("", image: tabSelection == 1 ? AppImages.selectedMap.rawValue : AppImages.unselectedMap.rawValue)
                    }
                }
                .tag(1)
           HomeView()
                .tabItem {
                    withAnimation(.linear(duration:0.5)){
                        Label("", image: tabSelection == 2 ? AppImages.selectedHome.rawValue :
                                AppImages.unselectedHome.rawValue)
                    }
                }
                .tag(2)
            ChatView()
                .tabItem {
                    withAnimation(.linear(duration:0.5)){
                        Label("", image: tabSelection == 3 ? AppImages.selectedChat.rawValue :
                                AppImages.unselectedChat.rawValue)
                    }
                }
                .tag(3)
            
          
            ProfileView()
                .tabItem {
                    withAnimation(.linear(duration:0.5)){
                        Label("", image: tabSelection == 4 ? AppImages.selectedProfile.rawValue :
                                AppImages.unselectedProfile.rawValue)
                    }
                }
                .tag(4)
        }
        
        .navigationBarHidden(true)
    }
}

struct TabBarControllerView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarControllerView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 14 Pro Max"))
            .previewDisplayName("iPhone 14 Pro Max")
        
        TabBarControllerView()
            .previewDevice(PreviewDevice(rawValue: "iPhone SE (3rd generation)"))
            .previewDisplayName("iPhone SE (3rd generation)")
    }
}
