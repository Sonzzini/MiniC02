//
//  PlainButton.swift
//  MiniC02
//
//  Created by Laura C. Balbachan dos Santos on 25/09/23.
//

import SwiftUI

struct PlainButtonStyle: ButtonStyle {
	 func makeBody(configuration: Configuration) -> some View {
		  configuration.label
				.frame(width: 361, height: 44)
				.font(.custom("SF Pro", size: 20))
				.fontWeight(.semibold)
				.foregroundColor(configuration.isPressed ? .black: .white)
				.background(configuration.isPressed ? Color("LightBlue"): Color("DarkBlue"))
				.cornerRadius(8)
	 }
}

