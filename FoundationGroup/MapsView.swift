//
//  MapsView.swift
//  FoundationGroup
//
//  Created by I Wayan Pande Putra Yudha on 13/04/23.
//

import SwiftUI
import MapKit

struct MapsView: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
    
    let annotations = [
        Location(name: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275)),
        Location(name: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508)),
        Location(name: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5)),
        Location(name: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667))
    ]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Map(coordinateRegion: $region,showsUserLocation: true, userTrackingMode: .constant(.follow),  annotationItems: annotations) {
                MapMarker(coordinate: $0.coordinate)
            }
//            .sheet(isPresented: .constant(true) ){
//                Text("test")
//            }
        }
        .ignoresSafeArea()
    }
}

struct MapsView_Previews: PreviewProvider {
    static var previews: some View {
        MapsView()
    }
}
