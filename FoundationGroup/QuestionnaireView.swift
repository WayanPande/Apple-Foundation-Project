//
//  QuestionnaireView.swift
//  FoundationGroup
//
//  Created by I Wayan Pande Putra Yudha on 08/04/23.
//

import SwiftUI

struct QuestionnaireView: View {
    
    @State private var questionAmount = 1.0
    @Binding public var showQuestionnaire: Bool
    @Binding public var doneFillingQuestionnaire: Bool
    @State private var rasa: [String] = []
    @State private var alergi: [String] = []
    @State private var umur: String?
    @State private var harga: String?
    @State private var tabSelection = 1
    var totalQuestions = 4
    
    let umurData = [
        "5-11 years old",
        "12-25 years old",
        "26-45 years old",
        "46-65 years old",
        "65+ years old"
    ]
    
    let hargaData = [
        "IDR 10k-20k",
        "IDR 20k-30k",
        "IDR 20k-40k",
        "IDR 40k-50k",
        "More than 50k"
    ]
    
    let rasaData = [
        "Sweet",
        "Salty",
        "Sour",
        "Spicy",
        "Bitter"
    ]
    
    let alergiData = [
        "Pork",
        "Beef",
        "Alcohol",
        "Seafood",
        "High Sugar",
        "High Carbo",
        "High Sodium",
        "Spicy",
        "Contain Milk",
        "Contain Egg",
        "Contain Gluten",
        "Contain Nuts"
    ]
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                ProgressView(value: questionAmount, total: Double(totalQuestions))
                Text("Question \(Int(questionAmount))/\(totalQuestions)")
                    .foregroundColor(.gray)
                
                TabView(selection: $tabSelection) {
                    SingleQuestionView(data: umurData, selected: $umur, title: "How Old Are You?")
                        .tag(1)
                    MultipleQuestionView(data: rasaData, selected: $rasa, title: "What Flavor Do You Like The Most?")
                        .tag(2)
                    MultipleQuestionView(data: alergiData, selected: $rasa, title: "What Food Restrictions Do You Live?")
                        .tag(3)
                    SingleQuestionView(data: hargaData, selected: $harga, title: "What is Your Price Range in Looking for Food?")
                        .tag(4)

                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                
                Spacer()
                HStack {
                    Button(action: {
                        withAnimation {
                            if !(questionAmount <= 1) {
                                questionAmount -= 1
                                tabSelection -= 1
                            }
                        }
                    }){
                        Text("Previous")
                    }
                    
                    Spacer()
                    Button(action: {
                        withAnimation {
                            if (questionAmount < 10) {
                                questionAmount += 1
                                tabSelection += 1
                            }
                        }
                    }){
                        Text("Next")
                    }
                    .padding()
                    .background(CustomColor.Primary)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    
                }
                .padding()
            }
            .padding()
            .navigationTitle("Questionnaire")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading){
                    Button("Cancel", role: .cancel) {
                        showQuestionnaire.toggle()
                    }
                    .foregroundColor(.red)
                }
                ToolbarItem {
                    Button("Done") {
                        showQuestionnaire.toggle()
                        doneFillingQuestionnaire = true
                    }
                }
            }
        }
        .accentColor(CustomColor.Primary)
    }
}

struct QuestionnaireView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionnaireView(showQuestionnaire: .constant(false), doneFillingQuestionnaire: .constant(false))
    }
}
