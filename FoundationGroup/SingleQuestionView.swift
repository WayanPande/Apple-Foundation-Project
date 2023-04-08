//
//  QuestionView.swift
//  FoundationGroup
//
//  Created by I Wayan Pande Putra Yudha on 08/04/23.
//

import SwiftUI

struct SingleQuestionView: View {
    
    var data: [String]
    @Binding public var selected: String?
    var title: String?
    
    var body: some View {
        List {
            Section (header: HStack{
                Text(title ?? "")
                    .padding(.vertical)
                    .fontWeight(.bold)
            }) {
                ForEach(data, id: \.self) {i in
                    MultipleSelectionRow(title: i, isSelected: selected == i) {
                        selected = i
                    }
                }
            }
        }
        .cornerRadius(15)
    }
}
