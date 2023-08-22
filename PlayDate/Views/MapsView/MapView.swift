//
//  MapView.swift
//  PlayDate
//
//  Created by عادل🫥 on 04/05/2023.
//

import SwiftUI
import MapKit
import CoreLocation
struct MapView: View {
    
    @StateObject var mapView : MapViewModel = .init()
    @Binding var searchLocation: String
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 31.464522, longitude: 74.2565877), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    var body: some View {
        VStack{
            
            ZStack{
               
                Map(coordinateRegion:$region)
                    .ignoresSafeArea()
            }
        }
    }
}
extension MapView{
    func searchMapField() -> some View{
        ZStack(alignment:.trailing){
            TextField("Search Loaction", text: $searchLocation)
                .padding(.vertical,12)
                .padding(.horizontal)
                .background(.white)
                .cornerRadius(44)
            Image("roundedMagnifier")
                .resizable()
                .frame(width: 30, height: 30)
                .padding(.trailing)

    
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView( searchLocation: .constant(""))
    }
}
