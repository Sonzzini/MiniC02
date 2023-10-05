//
//  PlainTagStyle.swift
//  MiniC02
//
//  Created by Laura C. Balbachan dos Santos on 05/10/23.
//

import SwiftUI

struct PlainTagStyle: ButtonStyle {
    @Binding var isSelected: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.custom("SF Pro", size: 15))
            .padding()
            .background(isSelected ? Color("DarkYellow"): Color("LightGray"))
            .cornerRadius(50)
            .overlay(
                RoundedRectangle(cornerRadius: 50)
                    .stroke(Color("DarkGray"), lineWidth: 0.5)
            )
    }
}
