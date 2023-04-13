//
//  StateManagement.swift
//  FoundationGroup
//
//  Created by I Wayan Pande Putra Yudha on 12/04/23.
//

import Foundation

class Favorite: ObservableObject {
    @Published var favoriteFoods: [Food]?
}
