//
//  FavoriteView.swift
//  FoundationGroup
//
//  Created by I Wayan Pande Putra Yudha on 06/04/23.
//

import SwiftUI

struct FavoriteView: View {
    
    @State private var searchQuery = ""
    @State private var foodsData = ReadData()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("\(foodsData.foods.count) Foods")
                        .fontWeight(.bold)
                    NavigationStack {
                        VStack(spacing: 20){
                            ForEach(foodsData.foods, id: \.id) {food in
                                FoodCardView(data: food)
                            }
                        }
                    }
                }
                .padding()
            }
            .navigationTitle(Text("Favorite").foregroundColor(.green))
            .searchable(text: $searchQuery)
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
