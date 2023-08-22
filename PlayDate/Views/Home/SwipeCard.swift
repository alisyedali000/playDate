//
//  SwipeCard.swift
//  PlayDate
//
//  Created by عادل🫥 on 01/05/2023.
//

import SwiftUI
import SDWebImageSwiftUI
struct SwipeCard: View {
    
    
    @EnvironmentObject var homeData: HomeViewModel
    @State var user: userModel
    @State var offset: CGFloat = 0
    @GestureState var isDragging: Bool = false
    @State var endSwipe: Bool = false
   
    var body: some View {
        loadView()
    }
}
extension SwipeCard{
    func loadView()->some View{
        GeometryReader{ geo in
            let index = CGFloat(homeData.getIndex(user: user))
            //            let _topOffset  = (index <= user  ? index : user) * 4
            ZStack(alignment:.bottom){
                let url = AppUrl.IMAGEURL + (user.image ?? "")
                WebImage(url: URL(string: url))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geo.size.width, height: geo.size.height)
                    .cornerRadius(24)
                    .offset(x:user.x,y: user.y)
                    .rotationEffect(Angle(degrees: user.degree))
                VStack{
                    cardCredentials()
                }
                
            }
        }
            .offset(x: offset)
            .rotationEffect(.init(degrees: getRotation(angle: 30)))
            .contentShape(Rectangle().trim(from: 0, to: endSwipe ? 0 : 1))
            .gesture(
                DragGesture()
//                    .updating($isDragging, body: { value, out, in
//                        out = true
//                    })
                    .onChanged({ value in
                        withAnimation(.default){
                            user.x = value.translation.width
                            user.y = value.translation.height
                            user.degree = 7 * (value.translation.width > 0 ? 1: -1)
                            let translation = value.translation.width
                            offset = (isDragging ? translation: .zero)
                        }
                    })
                    .onEnded{ value in
                        let width = getRect().width - 50
                        let translation = value.translation.width
                        let checkingStatus = (translation > 0 ? translation : -translation)
                        withAnimation{
                            if checkingStatus > (width / 2){
                                offset = (translation > 0 ? width: -width) * 2
                                endSwipeAction()
                            }
                            else{
                                offset = .zero
                            }
                        }
                        withAnimation(.interpolatingSpring(mass: 1.0, stiffness: 50, damping: 8,initialVelocity: 0)){
                            switch value.translation.width{
                            case 0...100:
                                user.x = 0; user.degree = 0; user.y = 0
                            case let x where x > 100:
                                user.x = 500; user.degree = 6.21
                            case (-100)...(-1):
                                user.x = 0; user.y = 0; user.degree = 0
                            case let x where x < -100:
                                user.x = -500 ; user.degree = -6.21
                            default: user.x = 0; user.y = 0

                            }


                        }
                       
                    
                    }
            )
            
            
//            .position(x: geo.size.width / 2, y: geo.size.height / 2)
//            .offset(x: user.x, y:  user.y)
//            .rotationEffect(Angle(degrees: user.degree))
//            .animation(.none)
//            .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .center)
            
        
                    
          
    }
    
    func getRotation(angle: Double) -> Double {
        
        let rotation = (offset / (getRect().width - 50)) * angle
        
        return rotation
    }
}

extension SwipeCard{
  
    func cardCredentials() -> some View{
        VStack{
            Spacer()
            HStack{
                HStack {
                    VStack(alignment:.leading){
                        HStack {
                            Text(user.name ?? "")
                                .foregroundColor(.white)
                                .font(.custom(DMSans.bold.rawValue, size: 25))
                            Image("vaccinated")
                                .resizable()
                                .frame(width: 40, height: 40)
                        }
                        Text(user.distance ?? "")
                            .foregroundColor(.white)
                            .font(.custom(DMSans.bold.rawValue, size: 11))
                    }
                    
                }
                Spacer()
                VStack {
                    cardAttributes(attribute: user.breed ?? "", image: AppImages.marcuspaw.rawValue)
                    cardAttributes(attribute: user.gender ?? "", image: AppImages.marcusgender.rawValue)
                    cardAttributes(attribute: user.age ?? "", image: AppImages.date.rawValue)
                }
                
            }.padding(10)
            
        }
    }
    func cardAttributes( attribute: String , image:String) -> some View{
        HStack{
            ZStack{
                RoundedRectangle(cornerRadius: 56)
                    .frame(width:53, height: 33)
                    .foregroundColor(.newcorgicolor)
                Text(attribute)
                    .font(.custom(DMSans.bold.rawValue, size: 12))
                    .foregroundColor(.white)
                
                
            }
            ZStack{
                RoundedRectangle(cornerRadius: 52)
                    .frame(width:40, height: 40)
                    .foregroundColor(.newcorgicolor)
                Image(image)
            }
        }.onAppear {
            let split = attribute.split(separator: " ")
            if split.count >= 2{
                let  _fname = String(split[0])
                user.breed = _fname
                
               
            }
        }
        
    }
    func endSwipeAction(){
        withAnimation(.none){ endSwipe = true}
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
            if let _ = homeData.fetched_users?.first{
                let _ = withAnimation{
                    homeData.fetched_users?.removeFirst()
                }
                
            }
        }
    }
}
extension SwipeCard{
    func getRect() -> CGRect{
        return UIScreen.main.bounds
    }
}




struct SwipeCard_Previews: PreviewProvider {
    static var previews: some View {
        SwipeCard(user: userModel())

    }
}

//import SwiftUI

