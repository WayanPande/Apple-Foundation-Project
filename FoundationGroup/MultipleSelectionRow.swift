//
//  MultipleSelectionRow.swift
//  FoundationGroup
//
//  Created by I Wayan Pande Putra Yudha on 08/04/23.
//

import SwiftUI

struct MultipleSelectionRow: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: self.action) {
            HStack {
                Text(self.title)
                    .foregroundColor(.black)
                Spacer()
                Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")

            }
        }
    }
}

struct MultipleSelectionRow_Previews: PreviewProvider {
    static var previews: some View {
        MultipleSelectionRow(title: "test", isSelected: true) {
            print("test")
        }
    }
}
