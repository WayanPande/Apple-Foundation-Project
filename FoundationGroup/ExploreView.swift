//
//  ExploreView.swift
//  FoundationGroup
//
//  Created by I Wayan Pande Putra Yudha on 06/04/23.
//

import SwiftUI


class FoodCategory {
    var title: String
    var img: String
    var id: UUID
    
    init(title: String, img: String){
        self.title = title
        self.img = img
        self.id = UUID()
    }
}

struct ExploreView: View {
    
    
    @State private var searchText = ""
    @State private var index = 0
    @State private var showQuestionnaire = false
    @State private var showLocation = false
    @State private var locationSearch = ""
    @State private var selectedLocation: String?
    let hour = Calendar.current.component(.hour, from: Date())
    
    func getFoodTime() -> String {
        switch hour {
        case 0...10:
            return "breakfast 🥐"
        case 11...17:
            return "lunch 😎"
        case 18...24:
            return "dinner 🥳"
        default:
            return "eat"
        }
    }
    
    var locationData = ["Banda Aceh", "Langsa", "Lhokseumawe", "Sabang", "Subulussalam", "Binjai", "Gunungsitoli", "Medan", "Padang Sidempuan", "Pematangsiantar", "Sibolga", "Tanjung Balai", "Tebing Tinggi", "Lubuklinggau", "Pagar Alam", "Palembang", "Prabumulih", "Sekayu", "Bukittinggi", "Padang", "Padang Panjang", "Pariaman", "Payakumbuh", "Sawahlunto", "Solok", "Sungai Penuh", "Jambi", "Bandung", "Bekasi", "Bogor", "Cimahi", "Cirebon", "Depok", "Sukabumi", "Tasikmalaya", "Banjar", "Magelang", "Pekalongan", "Salatiga Semarang", "Surakarta", "Tegal", "Semarang", "Batu", "Blitar", "Kediri", "Mojokerto", "Malang", "Madiun", "Surabaya", "Probolinggo", "Pasuruan", "Kota Administrasi Jakarta Pusat", "Kota Administrasi Jakarta Barat", "Kota Administrasi Jakarta Timur", "Kota Administrasi Jakarta Utara", "Kota Administrasi Jakarta Selatan", "Yogyakarta", "Cilegon", "Serang", "Tangerang", "Tangerang Selatan"]
    
    var foodCategory: [FoodCategory] = [
        FoodCategory(title: "Rice", img: "nasi"),
        FoodCategory(title: "Drink", img: "minum"),
        FoodCategory(title: "Chicken", img: "chicken"),
        FoodCategory(title: "Fast Food", img: "fast-food"),
        FoodCategory(title: "Noodle", img: "noodle"),
        FoodCategory(title: "Seafood", img: "seafood")
    ]
    
    
    var searchResults: [String]{
        if locationSearch.isEmpty {
            return locationData
        } else {
            return locationData.filter { $0.contains(locationSearch) }
        }
    }
    
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false){
                VStack(spacing: 20){
                    
                    
                    ZStack(alignment: .bottomTrailing) {
                        Image("exploreBG")
                            .resizable()
                            .scaledToFit()
                        
                        Image("burger")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 120)
                            .offset(x: -10, y: -10)
                        
                        Text("Let Us Help You To Choose Your Food")
                            .offset(x: -50, y: -140)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .font(.title2)
                            .shadow(radius: 3)

                        Button(action: {
                            showQuestionnaire.toggle()
                        }){
                            HStack{
                                Image(systemName: "pencil.line")
                                    .font(.system(size: 20))
                                Text("Questionnaire")
                                    .font(.headline)
                                    .fontWeight(.bold)

                            }
                            .padding(.all, 5)
                        }
                        .padding()
                        .background()
                        .cornerRadius(10)
                        .offset(x: -20, y: -20)
                        .sheet(isPresented: $showQuestionnaire) {
                            QuestionnaireView(showQuestionnaire: $showQuestionnaire)
                        }
                        
                    }
                    
                    VStack(alignment: .leading){
                        HStack {
                            Text("You should try this for ") +
                            Text(getFoodTime())
                                .fontWeight(.bold)
                        }
                        .padding(.horizontal)
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack {
                                ForEach(foodCategory, id: \.id) { item in
                                    ZStack(alignment: .topLeading) {
                                            
                                        Image("exploreBG")
                                            .resizable()
                                            .scaledToFit()
                                        
                                        Image(item.img)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 120)
                                            .offset(x: 120, y: 30)
                                        
                                        Text(item.title)
                                            .foregroundColor(.white)
                                            .shadow(radius: 3)
                                            .offset(x: 20, y: 10)
                                            .font(.title)
                                            .fontWeight(.bold)
                                    }
                                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 10))

                                }
                            }
                        }

                    }
                    .frame(height: 200)
                    .padding(.top)
                    
                    
                    ZStack {
                        Image("exploreBG")
                            .resizable()
                            .scaledToFit()
                        
                        HStack {
                            
                            Text("Most Popular Food")
                                .frame(width: 150)
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .font(.system(size: 36))
                                .shadow(radius: 3)
                            
                            Spacer()
                            
                            Image("chicken")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 250)
                     
                        }
                        .padding(.horizontal)
                        
                    }
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Explore")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    Button(action: {
                        showLocation.toggle()
                    }) {
                        Image(systemName: "location.fill")
                        Text(selectedLocation ?? "Location")
                    }
                    .sheet(isPresented: $showLocation) {
                        NavigationStack {
                            SingleQuestionView(data: searchResults, selected: $selectedLocation)
                                .navigationTitle("Location")
                                .navigationBarTitleDisplayMode(.inline)
                                .searchable(text: $locationSearch)
                                .toolbar {
                                    ToolbarItem(placement: .navigationBarLeading){
                                        Button("Cancel", role: .cancel) {
                                            showLocation.toggle()
                                        }
                                        .foregroundColor(.red)
                                    }
                                    ToolbarItem {
                                        Button("Done") {
                                            showLocation.toggle()
                                        }
                                    }
                                }
                                .padding()
                        }
                    }
                }
            }
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
