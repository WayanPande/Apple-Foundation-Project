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
            .sheet(isPresented: .constant(true) ){
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading){
                        Text("Latest in the area")
                            .font(.title)
                            .padding(.vertical, 30)
                        
                        VStack(alignment: .leading){
                            Text("Warung nearby")
                                .fontWeight(.semibold)
                                .padding(.vertical)
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(0..<5, id: \.self) {i in
                                        VStack{
                                            Image(i % 2 == 0 ? "crispy-chicken" : "fried-chicken")
                                                .resizable()
                                                .frame(width: 200)
                                                .scaledToFit()
                                            VStack(alignment: .leading) {
                                                Text(i % 2 == 0 ? "Crispy Chicken" : "Fried Chicken")
                                                    .fontWeight(.semibold)
                                                    .foregroundColor(CustomColor.Primary)
                                                Text("Crispy chicken typically refers to chicken that has a crispy, crunchy exterior and a juicy, tender interior. It is often coated in a batter or breading, which is then fried or baked until crispy.")
                                                    .foregroundColor(CustomColor.Primary)
                                                    .font(.caption)
                                                    .fontWeight(.light)
                                                    .lineLimit(2)
                                                
                                            }
                                            .padding(.horizontal)
                                            .padding(.top, 5)
                                            .padding(.bottom, 10)
                                        }
                                        .frame(width: 200,height: 200)
                                        .background(CustomColor.Secondary)
                                        .cornerRadius(10)
                                    }
                                }
                            }
                        }
                        
                        VStack(alignment: .leading){
                            Text("Recommendation for you")
                                .fontWeight(.semibold)
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(0..<5, id: \.self) {i in
                                        VStack{
                                            Image(i % 2 == 0 ? "crispy-chicken" : "fried-chicken")
                                                .resizable()
                                                .frame(width: 200)
                                                .scaledToFit()
                                            VStack(alignment: .leading) {
                                                Text(i % 2 == 0 ? "Crispy Chicken" : "Fried Chicken")
                                                    .fontWeight(.semibold)
                                                    .foregroundColor(CustomColor.Primary)
                                                Text("Crispy chicken typically refers to chicken that has a crispy, crunchy exterior and a juicy, tender interior. It is often coated in a batter or breading, which is then fried or baked until crispy.")
                                                    .foregroundColor(CustomColor.Primary)
                                                    .font(.caption)
                                                    .fontWeight(.light)
                                                    .lineLimit(2)
                                                
                                            }
                                            .padding(.horizontal)
                                            .padding(.top, 5)
                                            .padding(.bottom, 10)
                                        }
                                        .frame(width: 200,height: 200)
                                        .background(CustomColor.Secondary)
                                        .cornerRadius(10)
                                    }
                                }
                            }
                        }
                        
                    }
                }
                .padding()
                .presentationDetents([.height(350), .medium, .large])
                .presentationDragIndicator(.automatic)
                
            }
        }
        .ignoresSafeArea()
    }
}

struct MapsView_Previews: PreviewProvider {
    static var previews: some View {
        MapsView()
    }
}
