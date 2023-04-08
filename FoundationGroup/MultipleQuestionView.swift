//
//  MultipleQuestionView.swift
//  FoundationGroup
//
//  Created by I Wayan Pande Putra Yudha on 08/04/23.
//

import SwiftUI

struct MultipleQuestionView: View {
    
    var data: [String]
    @Binding public var selected: [String]
    var title: String?
    
    var body: some View {
        List {
            Section (header: HStack{
                Text(title ?? "")
                    .padding(.vertical)
                    .fontWeight(.bold)
            }) {
                ForEach(data, id: \.self) {i in
                    MultipleSelectionRow(title: i, isSelected: selected.contains(i)) {
                        if selected.contains(i) {
                            selected.removeAll(where: { $0 == i })
                        }
                        else {
                            selected.append(i)
                        }
                    }
                }
            }
        }
        .cornerRadius(15)
    }
}

