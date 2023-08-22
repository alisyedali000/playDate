//
//  MapViewModel.swift
//  PlayDate
//
//  Created by عادل🫥 on 04/05/2023.
//

import SwiftUI
import CoreLocation
import MapKit
class MapViewModel: NSObject, ObservableObject, MKMapViewDelegate,CLLocationManagerDelegate{
    @Published var mapView : MKMapView = .init()
    @Published var manager : CLLocationManager = .init()
    @Published var searchText: String = ""
    @Published var fetchedPlaces: [CLPlacemark]?
    
    override init() {
        super.init()
        manager.delegate = self
        mapView.delegate = self
        manager.requestWhenInUseAuthorization()
        
        
      
    }
    func fetchPlaces(value:String){
        Task{
            do{
                let request = MKLocalSearch.Request()
                request.naturalLanguageQuery = value.lowercased()
                let response = try await MKLocalSearch(request: request).start()
                await MainActor.run(body: {
                    self.fetchedPlaces = response.mapItems.compactMap({ item -> CLPlacemark? in
                        return item.placemark
                    })
                })
            }
                catch{
                    
                }
            }
        
    }
  
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
       print(error.localizedDescription)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus{
        case .authorizedAlways: manager.requestLocation()
        case .authorizedWhenInUse: manager.requestLocation()
        case .denied: handleLocationError()
        case .notDetermined: manager.requestWhenInUseAuthorization()
      
        default: ()
            
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let _ = locations.last else{return}
    }
    
    func handleLocationError(){
        
    }
}
