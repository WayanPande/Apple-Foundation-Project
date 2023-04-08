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

    
    var body: some View {
        NavigationStack {
            ScrollView{
                VStack(spacing: 20){
                    
                    
                    ZStack(alignment: .trailing) {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(.green)
                            .frame(height: 200)
                            .padding()
                        Button(action: {
                            showQuestionnaire.toggle()
                        }){
                            Text("Questionnaire")
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
                            Text("lunch")
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
                        print("About tapped!")
                    }) {
                        Image(systemName: "location.fill")
                        Text("Location")
                    }
                }
                
                ToolbarItem{
                    Button(action: {
                        print("Help tapped!")
                    }) {
                        Image(systemName: "person.circle.fill")
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
