//
//  TagView.swift
//  MiniC02
//
//  Created by Laura C. Balbachan dos Santos on 03/10/23.
//

import SwiftUI
import UserNotifications

struct TagButton: Identifiable {
	let id = UUID()
	var nome: String
	var togle = false
}

struct TagView: View {
	var name: String
	let columns = [
		GridItem(.flexible(minimum: 120, maximum: 500), spacing: 10),
		GridItem(.flexible(minimum: 120, maximum: 500), spacing: 10),
		GridItem(.flexible(minimum: 120, maximum: 500), spacing: 10),
	]
	
	@State private var tags: [String] = []
	@State private var isSelected = false
	@Binding var sheetIsPresented: Bool
	
	@State private var showingSheet = false
	@EnvironmentObject var vm : ViewModel
	@Environment(\.dismiss) private var dismiss
	
	var TagIdentifiers: [String] = ["Bilíngue", "Sinalizado", "Oralizado", "Leitura Labial", "Intérprete", "Trilíngue", "Implante Coclear", "Profissional da Saúde", "Simpatizante"]
	var TagHobbies: [String] = ["Esportes", "Artes", "Pets", "Jogos", "Animes", "Festas", "Comida", "Exercício", "Investimento", "Livros", "Música", "Podcast", "Tecnologia", "Parque", "Teatro", "Rede Social", "Viagem", "Religião"]
	
	@Environment(\.colorScheme) var colorScheme
	
	var body: some View {
		NavigationStack {
			ZStack {
				
				if colorScheme == .light {
					Color.white
				} else {
					Color("NewDark")
				}
				
				Image(colorScheme == .light ? "blackgreenblob" : "whitegreenblob")
					.resizable()
					.scaledToFit()
					.frame(width: 150)
					.position(x: UIScreen.main.bounds.width - 30, y: UIScreen.main.bounds.height - 30)
				
				Image(colorScheme == .light ? "blacksemicircle" : "whitesemicircle")
					.resizable()
					.scaledToFit()
					.frame(width: 152)
					.position(x: 20, y: UIScreen.main.bounds.height - 20)
				
				Image(colorScheme == .light ? "blackpeachstar" : "whitepeachstar")
					.resizable()
					.scaledToFit()
					.frame(width: 100)
					.position(x: 120, y: 100)
				
				Image(colorScheme == .light ? "blackgreenleaf" : "whitegreenleaf")
					.resizable()
					.scaledToFit()
					.frame(width: 50)
					.position(x: UIScreen.main.bounds.width * 0.8, y: UIScreen.main.bounds.height * 0.7)
				
				VStack {
					Spacer()
					
					TagViewHeader
						.padding(.top, 50)
					
//					ScrollView(.vertical) {
						FlowLayout {
							ForEach(TagIdentifiers.indices, id: \.self) { index in
								TagButtonView(tags: $tags, string: TagIdentifiers[index])
									.padding(.horizontal, 5)
									.padding(.vertical, 7)
							}
						}
//					}
					
					Spacer()
					
					Button("Continuar") {
						UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
							if success {
								print("All set!")
							} else if let error = error {
								print(error.localizedDescription)
							}
						}
						
						if vm.controller[0].firstLogin == true {
							print("Setting up profile")
							vm.setupProfile(name: name, tags: tags)
							vm.controller[0].firstLogin = false
							try? vm.context.save()
							
						} else if vm.controller[0].firstLogin == false {
							print("Updating profile!")
							vm.updateProfile(name: name, tags: tags)
						}
						
						
						sheetIsPresented.toggle()
					}
					.padding(.bottom, 100)
					.buttonStyle(SecondaryPlainButtonStyle())
					
					
				}
				
				
			}
			.ignoresSafeArea()
		}
	}
}

extension TagView {
	private var TagViewHeader: some View {
		VStack {
//			Image("hiLibras")
//				.resizable()
//				.frame(width: 129, height: 134.7)
//				.padding(.bottom, 24)
			
			Text("Como você se identifica?")
				.font(.custom("SF Pro", size: 36))
				.fontWeight(.bold)
				.padding(.bottom)
				.foregroundStyle(colorScheme == .light ? Color("NewPurple") : Color.white)
				.multilineTextAlignment(.center)
			
			Text("Essas tags irão aparecer em seu perfil")
				.font(.custom("SF Pro", size: 16))
				.fontWeight(.semibold)
				.foregroundStyle(Color("DarkGray"))
				.padding(.bottom, 25)
		}
	}
}


struct FlowLayout: Layout {
	
	func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
		let sizes = subviews.map { $0.sizeThatFits(.unspecified) }
		
		var totalHeight: CGFloat = 0
		var totalWidth: CGFloat = 0
		
		var lineWidth: CGFloat = 0
		var lineHeight: CGFloat = 0
		
		for size in sizes {
			if lineWidth + size.width > proposal.width ?? 0 {
				totalHeight += lineHeight
				lineWidth = size.width
				lineHeight = size.height
			} else {
				lineWidth += size.width
				lineHeight = max(lineHeight, size.height)
			}
			
			totalWidth = max(totalWidth, lineWidth)
		}
		
		totalHeight += lineHeight
		
		return .init(width: totalWidth, height: totalHeight)
	}
	
	func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
		let sizes = subviews.map { $0.sizeThatFits(.unspecified) }
		
		var lineX = bounds.minX
		var lineY = bounds.minY
		var lineHeight: CGFloat = 0
		
		for index in subviews.indices {
			if lineX + sizes[index].width > (proposal.width ?? 0) {
				lineY += lineHeight
				lineHeight = 0
				lineX = bounds.minX
			}
			
			subviews[index].place(
				at: .init(
					x: lineX + sizes[index].width / 2,
					y: lineY + sizes[index].height / 2
				),
				anchor: .center,
				proposal: ProposedViewSize(sizes[index])
			)
			
			lineHeight = max(lineHeight, sizes[index].height)
			lineX += sizes[index].width
		}
	}
}
