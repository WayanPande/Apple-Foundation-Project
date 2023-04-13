//
//  SearchView.swift
//  FoundationGroup
//
//  Created by I Wayan Pande Putra Yudha on 06/04/23.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchText = ""
    @State private var showFilter = false
    @State private var selection: [String] = []
    @State private var rasa: String?
    @State private var pillFilter: String?
    @ObservedObject var datas = ReadData()
    @State private var foodsData = ReadData().foods
    
    let jenis = [
        "Rice",
        "Drinks",
        "Chicken",
        "Fast Food",
        "Noodle",
        "Seafood",
    ]
    
    var searchResults: [Food]{
        if searchText.isEmpty {
            return foodsData
        } else {
            return foodsData.filter { $0.name.contains(searchText) }
        }
    }
    
    var body: some View {
        NavigationStack {
            List {
                ScrollView(.horizontal, showsIndicators: false){
                    HStack {
                        Button(action: {
                            showFilter.toggle()
                        },label: {
                            Image(systemName: "slider.horizontal.3")
                                .font(.system(size: 14))
                            Text("Filter")
                                .fontWeight(.bold)
                                .font(.system(size: 13))
                        })
                        .padding(.all, 10)
                        .background(CustomColor.Primary)
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                        .sheet(isPresented: $showFilter){
                            VStack {
                                NavigationStack {
                                    
                                    List {
                                        Section(header: HStack{
                                            Text("Rasa")
                                            Spacer()
                                            Button("All"){
                                                for i in jenis {
                                                    selection.append(i)
                                                }
                                            }
                                        }){
                                            ForEach(jenis, id: \.self) {i in
                                                MultipleSelectionRow(title: i, isSelected: selection.contains(i)) {
                                                    if selection.contains(i) {
                                                        selection.removeAll(where: { $0 == i })
                                                    }
                                                    else {
                                                        selection.append(i)
                                                    }
                                                }
                                            }
                                        }
                                        
                                        Section(header: Text("Cova")){
                                            ForEach(jenis, id: \.self) {i in
                                                MultipleSelectionRow(title: i, isSelected: rasa == i) {
                                                    rasa = i
                                                }
                                            }
                                        }
                                        
                                        Section(header: Text("Cova")){
                                            ForEach(jenis, id: \.self) {i in
                                                MultipleSelectionRow(title: i, isSelected: rasa == i) {
                                                    rasa = i
                                                }
                                            }
                                        }
                                        
                                        Section(header: Text("Cova")){
                                            ForEach(jenis, id: \.self) {i in
                                                MultipleSelectionRow(title: i, isSelected: rasa == i) {
                                                    rasa = i
                                                }
                                            }
                                        }
                                        
                                    }
                                    .navigationTitle("Filter")
                                    .navigationBarTitleDisplayMode(.inline)
                                    .toolbar {
                                        Button("Done") {
                                            showFilter.toggle()
                                        }
                                    }
                                    
                                }
                                .presentationDetents([.medium, .large])
                                
                                //                                Text("\(selection ?? "N/A")")
                            }
                            
                        }
                        
                        ForEach(jenis, id: \.self){i in
                            
                            if pillFilter == i {
                                Button(action: {
                                    pillFilter = nil
                                    print(self.datas)
                                }){
                                    Text(i)
                                        .fontWeight(.bold)
                                        .font(.system(size: 10))
                                }
                                .padding(.all, 10)
                                .background(CustomColor.Secondary)
                                .foregroundColor(CustomColor.Primary)
                                .clipShape(Capsule())
                                .overlay {
                                    RoundedRectangle(
                                        cornerRadius: 25,
                                        style: .continuous
                                    )
                                    .stroke(CustomColor.Primary, lineWidth: 1)
                                }
                            }else {
                                Button(action: {
                                    pillFilter = i
                                }){
                                  Text(i)
                                    .font(.system(size: 10))
                                }
                                .padding(.all, 10)
                                .background(CustomColor.Secondary)
                                .foregroundColor(CustomColor.Primary)
                                .clipShape(Capsule())
                                
                            }
                            
                        }
                    }
                    .padding(.bottom, 3)
                }
                .listRowSeparator(.hidden)
                ScrollView {
                    NavigationStack {
                        VStack(spacing: 20){
                            ForEach(searchResults, id: \.id) {food in
                                FoodCardView(data: food)
                            }
                        }
                    }
                }
                .listRowSeparator(.hidden)
            }
            .navigationTitle("Search")
            .listStyle(PlainListStyle())
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
