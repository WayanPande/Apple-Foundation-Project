//
//  SplashView.swift
//  FoundationGroup
//
//  Created by I Wayan Pande Putra Yudha on 12/04/23.
//

import SwiftUI

struct SplashView: View {
    
    @State var isActive: Bool = false
    
    var body: some View {
        ZStack {
            if self.isActive {
                ContentView()
            } else {
                Rectangle()
                    .fill(CustomColor.Secondary)
                    .ignoresSafeArea()
 
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 150)
                
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
