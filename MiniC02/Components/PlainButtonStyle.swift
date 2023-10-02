//
//  PlainButton.swift
//  MiniC02
//
//  Created by Laura C. Balbachan dos Santos on 25/09/23.
//

import SwiftUI

struct PlainButton: ButtonStyle {
	 func makeBody(configuration: Configuration) -> some View {
		  configuration.label
				.frame(width: 361, height: 44)
				.font(.custom("SF Pro", size: 20))
				.fontWeight(.semibold)
				.foregroundColor(configuration.isPressed ? .gray: .black)
				.background(configuration.isPressed ? Color("DarkBlue"): Color("LightBlue"))
				.cornerRadius(8)
	 }
}

struct PlainButton_Previews: PreviewProvider {
	 static var previews: some View {
		  Button {
				print("aaaAAaaa")
		  } label: {
				Text("Continuar")
		  }
		  .buttonStyle(PlainButton())
	 }
}
