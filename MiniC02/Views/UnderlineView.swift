//
//  UnderlineView.swift
//  MiniC02
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 09/10/23.
//

import SwiftUI

/// This modifier provides an animated underscore for the SegmentedControl.
struct UnderlineModifier: ViewModifier
{
	 var selectedIndex: Int
	 let frames: [CGRect]

	 func body(content: Content) -> some View
	 {
		  content
				.background(
					 Rectangle()
						  .fill(Color("DarkBlue"))
						  .frame(width: frames[selectedIndex].width, height: 3)
						  .offset(x: frames[selectedIndex].minX - frames[0].minX), alignment: .bottomLeading
				)
				.background(
					 Rectangle()
						  .fill(Color.gray)
						  .frame(height: 0.5), alignment: .bottomLeading
				)
	 }
}
