//
//  OnboardingView.swift
//  MiniC02
//
//  Created by Laura C. Balbachan dos Santos on 28/09/23.
//

import SwiftUI

struct OnboardingView: View {
    @State private var tabNumber = 0
    
    var body: some View {
        TabView(selection: $tabNumber,
                content:  {
            BemVindoView().tabItem { Text("Tutorial 1") }.tag(1)
            Text("Tab Content 2").tabItem { Text("Tab Label 2") }.tag(2)
        })
        .tabViewStyle(.page)
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}


#Preview {
    OnboardingView()
}
