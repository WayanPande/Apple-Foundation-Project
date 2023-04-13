//
//  FoodCardView.swift
//  FoundationGroup
//
//  Created by I Wayan Pande Putra Yudha on 06/04/23.
//

import SwiftUI

struct FoodCardView: View {
    
    public var data: Food
    
    var body: some View {
        NavigationLink(destination: FoodDetailView(data: data)){
            ZStack(alignment: .topLeading){
                HStack {
                    AsyncImage(url: URL(string: data.imageURL)!) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        HStack {
                            Spacer()
                            ProgressView()
                            Spacer()
                        }
                    }
                    .frame(width: 130, height: 120)
                    .cornerRadius(10)
                 
                    VStack(alignment: .leading) {
                        Text(data.name)
                            .fontWeight(.bold)
                            .font(.title3)
                        Text(data.description)
                            .multilineTextAlignment(.leading)
                            .lineLimit(3)
                            .truncationMode(.tail)
                        
                        HStack {
                            if !data.halal {
                                Image("pork")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 21)
                            }
                            Image("gluten")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 21)
                            Image("fish")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 21)
                        }
                    }
                }
                
                if !data.halal {
                    Text("Non Halal")
                        .padding(.vertical, 5)
                        .padding(.top, 10)
                        .padding(.horizontal, 5)
                        .font(.system(size: 11))
                        .fontWeight(.semibold)
                        .background(CustomColor.Primary)
                        .foregroundColor(.white)
                        .cornerRadius(5)
                        .offset(x: -10, y: -25)
                }
            
            }
            .padding()
            .background(CustomColor.Secondary)
            .foregroundColor(CustomColor.Primary)
            .cornerRadius(10)
        }
    }
}

struct FoodCardView_Previews: PreviewProvider {
    static var previews: some View {
        FoodCardView(data: Food(name: "Nasi Padang", type: "Nasi", price: 2000, ingredients: [], imageURL: "https://source.unsplash.com/random/800x600/?ramen", description: "test test test test test test test test test test", halal: true))
    }
}
