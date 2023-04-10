//
//  ExploreView.swift
//  FoundationGroup
//
//  Created by I Wayan Pande Putra Yudha on 06/04/23.
//

import SwiftUI

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
    
    //    @State var searchResults: [String]
    
    
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
                    
                    
                    ZStack(alignment: .trailing) {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(.green)
                            .frame(height: 100)
                            .padding()
                        Button(action: {
                            showQuestionnaire.toggle()
                        }){
                            Image(systemName: "pencil.line")
                            Text("Isi")
                                .fontWeight(.bold)
                        }
                        .padding()
                        .background()
                        .cornerRadius(10)
                        .offset(x: -30)
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
                        TabView(selection: $index) {
                            ForEach((0..<3), id: \.self) { index in
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(.green)
                                    .padding()
                                    .frame(height: 200)
                            }
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                    }
                    .frame(height: 200)
                    
                    
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.purple)
                        .frame(height: 200)
                        .padding()
                    Spacer()
                }
            }
            .padding()
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
            .searchable(text: $searchText)
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
