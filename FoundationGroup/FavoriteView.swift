//
//  FavoriteView.swift
//  FoundationGroup
//
//  Created by I Wayan Pande Putra Yudha on 06/04/23.
//

import SwiftUI

struct FavoriteView: View {
    
    @State private var searchQuery = ""
    @State private var foodsData = ReadData().foods
    
    var searchResults: [Food]{
        if searchQuery.isEmpty {
            return foodsData
        } else {
            return foodsData.filter { $0.name.contains(searchQuery) }
        }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("\(searchResults.count) Foods")
                        .fontWeight(.bold)
                    VStack(spacing: 20){
                        ForEach(searchResults, id: \.id) {food in
                            FoodCardView(data: food)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle(Text("Favorite").foregroundColor(.green))
            .searchable(text: $searchQuery, prompt: Text("Search favorite food"))
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
