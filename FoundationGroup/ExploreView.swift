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
    @State private var doneFillingQuestionnaire = false
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
                    
                    if doneFillingQuestionnaire {
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
                    
                    ZStack(alignment: .bottomTrailing) {
                        Image("exploreBG")
                            .resizable()
                            .scaledToFit()
                            .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                        
                        Image("burger")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 120)
                            .offset(x: -10, y: -10)
                        
                        Text("Let Us Help You To Choose Your Food")
                            .offset(x: -50, y: -140)
                            .foregroundColor(CustomColor.Primary)
                            .fontWeight(.bold)
                            .font(.title2)

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
                            QuestionnaireView(showQuestionnaire: $showQuestionnaire, doneFillingQuestionnaire: $doneFillingQuestionnaire)
                        }
                        .shadow(radius: 0.2)
                        
                    }
                    
                    VStack(alignment: .leading){
                        HStack {
                            Text("You should try this for ") +
                            Text(getFoodTime())
                                .fontWeight(.bold)
                                .foregroundColor(CustomColor.Primary)
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
                                            .foregroundColor(CustomColor.Primary)
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
                                .foregroundColor(CustomColor.Primary)
                                .fontWeight(.bold)
                                .font(.system(size: 36))
                            
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
                        .accentColor(CustomColor.Primary)
                    }
                }
            }
        }
        .accentColor(CustomColor.Primary)
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
