//
//  PlainTagStyle.swift
//  MiniC02
//
//  Created by Laura C. Balbachan dos Santos on 05/10/23.
//

import SwiftUI

struct PlainTagStyle: ButtonStyle {
    @Binding var isSelected: Bool
	@Environment(\.colorScheme) var colorScheme
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.custom("SF Pro", size: 15))
				.fontWeight(.heavy)
				.lineLimit(1)
				.fixedSize(horizontal: true, vertical: true)
            .padding()
				.foregroundStyle(isSelected ? (colorScheme == .light ? Color.black : Color.white) : (colorScheme == .light ? Color.black : Color("NewPurple")))
				.background(isSelected ? (colorScheme == .light ? Color("NewPeach") : Color("NewPurple")) : Color.white)
				.frame(height: 44)
            .cornerRadius(50)
            .overlay(
                RoundedRectangle(cornerRadius: 50)
						.stroke(colorScheme == .light ? Color.black : Color.white, lineWidth: 2.5)
            )
    }
}
