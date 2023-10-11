//
//  ImagePickSheetView.swift
//  MiniC02
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 11/10/23.
//

import SwiftUI

struct ImagePickSheetView: View {
	
	@Binding var imageIsPicked: Bool
	@Binding var imageName: String
	
	@Environment(\.dismiss) private var dismiss
	
	var body: some View {
		NavigationStack {
			ScrollView {
				
				LazyVGrid(columns: [GridItem(.flexible(minimum: 100, maximum: 150)), GridItem(.flexible(minimum: 100, maximum: 150))]) {
					ForEach(1..<21) { num in
						Button {
							if !imageIsPicked {
								imageIsPicked.toggle()
							}
							imageName = "image\(num)"
							dismiss()
						} label: {
							Image("image\(num)")
								.resizable()
								.scaledToFit()
								.frame(width: 150)
						}

						

					}
				}
				.padding(.vertical)
				
			}
		}
	}
}

