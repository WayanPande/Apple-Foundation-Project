//
//  FoodCardView.swift
//  FoundationGroup
//
//  Created by I Wayan Pande Putra Yudha on 06/04/23.
//

import SwiftUI

struct FoodCardView: View {
    var body: some View {
        HStack {
            Image("SushiTeiLogo")
                .resizable()
                .scaledToFit()
                .frame(height: 100)
                .cornerRadius(10)
                .padding(.all, 10)
         
            VStack(alignment: .leading) {
                Text("Nasi Padang")
                    .fontWeight(.bold)
                    .font(.title3)
                Text("loram ipsum lorem ipsum lorem ipsum")
                
            }
        }
        .padding()
        .background(CustomColor.Secondary)
        .foregroundColor(CustomColor.Primary)
        .cornerRadius(10)
        
    }
}

struct FoodCardView_Previews: PreviewProvider {
    static var previews: some View {
        FoodCardView()
    }
}
