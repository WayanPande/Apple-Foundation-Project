//
//  JsonRead.swift
//  FoundationGroup
//
//  Created by I Wayan Pande Putra Yudha on 08/04/23.
//

import Foundation

struct Food: Codable {
    let name: String
    let type: String
    let price: Double
    let ingredients: [String]
    let imageURL: String
    let description: String
    let id = UUID()
    let halal: Bool
    
    enum CodingKeys: String, CodingKey {
        case name, type, price, ingredients
        case imageURL = "image_url"
        case description, halal
    }
}

class ReadData: ObservableObject  {
    @Published var foods = [Food]()
    
        
    init(){
        loadData()
    }
    
    func loadData()  {
        guard let url = Bundle.main.url(forResource: "foods", withExtension: "json")
            else {
                print("Json file not found")
                return
            }
        
        let data = try? Data(contentsOf: url)
        let foods = try? JSONDecoder().decode([Food].self, from: data!)
        self.foods = foods!
        
    }
     
}
