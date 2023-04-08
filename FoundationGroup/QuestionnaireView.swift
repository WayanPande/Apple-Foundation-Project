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
    @State private var rasa: [String] = []
    @State private var umur: String?
    @State private var harga: String?
    @State private var tabSelection = 1
    var totalQuestions = 3
    
    let umurData = [
        "0-5 tahun",
        "6-15 tahun",
        "16-25 tahun",
        "25+ tahun"
    ]
    
    let hargaData = [
        "< 10.000",
        "10.000 <= 20.000"
    ]
    
    let rasaData = [
        "Manis",
        "Asin",
        "Asam",
        "Gurih",
        "Pedas",
        "Pahit"
    ]
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                ProgressView(value: questionAmount, total: Double(totalQuestions))
                Text("Question \(Int(questionAmount))/\(totalQuestions)")
                    .foregroundColor(.gray)
                
                TabView(selection: $tabSelection) {
                    SingleQuestionView(data: umurData, selected: $umur, title: "Rentang umur?")
                        .tag(1)
                    MultipleQuestionView(data: rasaData, selected: $rasa, title: "Suka makanan seperti apa?")
                        .tag(2)
                    SingleQuestionView(data: hargaData, selected: $harga, title: "Rentang harga?")
                        .tag(3)
                    
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
                    }
                }
            }
        }
    }
}

struct QuestionnaireView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionnaireView(showQuestionnaire: .constant(false))
    }
}
