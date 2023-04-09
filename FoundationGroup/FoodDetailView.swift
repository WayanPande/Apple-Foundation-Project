//
//  FoodDetailView.swift
//  FoundationGroup
//
//  Created by I Wayan Pande Putra Yudha on 08/04/23.
//

import SwiftUI
import MapKit

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}


struct FoodDetailView: View {
    
    public var data: Food
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
    @State private var liked = false
    
    let annotations = [
        Location(name: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275)),
        Location(name: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508)),
        Location(name: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5)),
        Location(name: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667))
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    AsyncImage(url: URL(string: data.imageURL)!) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        HStack {
                            Spacer()
                            ProgressView()
                            Spacer()
                        }
                    }
                    .frame(height: 250)
                    .padding(.bottom)
                    
                    HStack {
                        Text(data.type)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Spacer()
                        Button(action: {
                            liked.toggle()
                        }){
                            Image(systemName: !liked ? "heart" :  "heart.fill")
                                .padding(.all, 7)
                                .foregroundColor(.red)
                                .background(.gray.opacity(0.1))
                                .clipShape(Circle())
                        }
                    }
                    .padding(EdgeInsets(top: 15, leading: 15, bottom: 0, trailing: 15))
                    
                    Text(data.name)
                        .padding(EdgeInsets(top: 15, leading: 15, bottom: 5, trailing: 15))
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text(data.description)
                        .padding(.horizontal)
                        .font(.subheadline)
                    
                    Text("Ingredients")
                        .padding(EdgeInsets(top: 25, leading: 15, bottom: 0, trailing: 0))
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                    
                    
                    VStack(alignment: .leading, spacing: 5) {
                        ForEach(data.ingredients, id: \.self) { item in
                            HStack{
                                Image(systemName: "circle")
                                Text(item)
                                    .font(.subheadline)
                            }
                            
                        }
                    }
                    .padding()
                    
                    Text("Warung near you")
                        .padding(EdgeInsets(top: 25, leading: 15, bottom: 0, trailing: 0))
                        .fontWeight(.semibold)
                        .foregroundColor(.gray)
                    HStack{
                        Spacer()
                        Map(coordinateRegion: $region,showsUserLocation: true, userTrackingMode: .constant(.follow),  annotationItems: annotations) {
                            MapMarker(coordinate: $0.coordinate)
                        }
                        .frame(height: 300)
                        .cornerRadius(10)
                        Spacer()
                    }
                    .padding()
                    
                }
                .padding(.bottom)
            }
            .ignoresSafeArea()
        }
    }
}

struct FoodDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FoodDetailView(data: Food(name: "Nasi Padang", type: "Nasi", price: 2000, ingredients: ["flour", "butter", "milk", "sugar", "salt", "yeast"], imageURL: "https://source.unsplash.com/random/800x600/?ramen", description: "A French pastry made with layers of buttery, flaky dough, typically served as a breakfast item or snack."))
    }
}
