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

struct NewPlainButtonStyle: ButtonStyle {
	@Environment(\.colorScheme) var colorScheme
	
	func makeBody(configuration: Configuration) -> some View {
		configuration.label
			.frame(width: 361, height: 44)
			.font(.custom("SF Pro", size: 20))
			.fontWeight(.semibold)
			.foregroundStyle(colorScheme == .light ? Color("NewPurple") : Color("NewPeach"))
			.background(Color.white)
			.cornerRadius(8)
	}
}

struct SecondaryPlainButtonStyle: ButtonStyle {
	@Environment(\.colorScheme) var colorScheme
	
	func makeBody(configuration: Configuration) -> some View {
		configuration.label
			.frame(width: 361, height: 44)
			.font(.custom("SF Pro", size: 20))
			.fontWeight(.semibold)
			.foregroundStyle(colorScheme == .light ? Color.white : Color("NewPeach"))
			.background(colorScheme == .light ? Color("NewPurple") : Color.white)
			.cornerRadius(8)
	}
}


struct EventButtonStyle: ButtonStyle {
	@Environment(\.colorScheme) var colorScheme
	
	func makeBody(configuration: Configuration) -> some View {
		configuration.label
			.frame(width: 361, height: 44)
			.font(.custom("SF Pro", size: 20))
			.fontWeight(.semibold)
			.foregroundStyle(.white)
			.background(Color("NewPurple"))
			.cornerRadius(8)
	}
}
