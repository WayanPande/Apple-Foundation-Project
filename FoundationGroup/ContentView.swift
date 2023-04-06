//
//  ContentView.swift
//  FoundationGroup
//
//  Created by I Wayan Pande Putra Yudha on 06/04/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ExploreView()
                .tabItem{
                    Label("Explore", systemImage: "globe")
                }
            SearchView()
                .tabItem{
                    Label("Search", systemImage: "magnifyingglass")
                }
            FavoriteView()
                .tabItem{
                    Label("Favorite", systemImage: "heart.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
