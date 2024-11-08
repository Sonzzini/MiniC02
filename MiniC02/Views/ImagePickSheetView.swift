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
			GeometryReader { g in
				ScrollView {
					
					Text("Escolha uma imagem:")
						.font(.title3)
						.bold()
						.padding(.top, 20)
						.padding(.vertical, 30)
					
					
					LazyVGrid(columns: [GridItem(.flexible(minimum: 0, maximum: 160)), GridItem(.flexible(minimum: 0, maximum: 160)), GridItem(.flexible(minimum: 0, maximum: 160))], spacing: 10) {
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
									.scaledToFill()
									.frame(width: g.size.width / 3.2, height: g.size.width / 3.2)
									.clipped()
									.clipShape(RoundedRectangle(cornerRadius: 8))
								
							}
						}
					}
					
				}
				.scrollIndicators(.hidden)
				
				
			}
			.padding(.horizontal, 10)
			
		}
	}
}

