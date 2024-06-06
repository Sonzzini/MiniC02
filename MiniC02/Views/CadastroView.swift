//
//  CadastroView.swift
//  MiniC02
//
//  Created by Laura C. Balbachan dos Santos on 29/09/23.
//

import SwiftUI

// Essa tela precisa de CoreData
struct CadastroView: View {
	@EnvironmentObject var vm: ViewModel
	@State private var name = ""
	
	@Binding var sheetIsPresented: Bool
	@Environment(\.colorScheme) var colorScheme
	
	@State var alertWillPresent = false
    
	var body: some View {
		NavigationStack {
			ZStack {
				
				if colorScheme == .light {
					Color.white
				} else {
					Color("NewDark")
				}
				
				Image(colorScheme == .light ? "blackgreenleaf" : "whitegreenleaf")
					.resizable()
					.scaledToFit()
					.frame(width: 50)
					.position(x: UIScreen.main.bounds.width - 50, y: 85)

				Image(colorScheme == .light ? "blackyellowstar" : "whiteyellowstar")
					.resizable()
					.scaledToFit()
					.frame(width: 122)
					.position(x: 20, y: (UIScreen.main.bounds.height / 2) + 50)

				Image(colorScheme == .light ? "blackpeachblob" : "whitepeachblob")
					.resizable()
					.scaledToFit()
					.frame(width: 88)
					.position(x: UIScreen.main.bounds.width * 0.8, y: UIScreen.main.bounds.height * 0.7)

				VStack {
					//				Image("hiLibras")
					//					.resizable()
					//					.frame(width: 129, height: 134.7)
					//					.padding(.bottom, 24)
					
					Spacer()
					
					Text("Nos diga como prefere ser chamado(a)")
						.font(.custom("SF Pro", size: 35))
						.fontWeight(.bold)
						.padding(.bottom, 24)
//						.padding(.horizontal, 17)
						.multilineTextAlignment(.center)
						.foregroundStyle(colorScheme == .light ? Color("NewPurple") : Color.white)
					
					TextField("Seu Nome", text: $name)
						.font(.custom("SF Pro", size: 28))
						.fontWeight(.bold)
						.multilineTextAlignment(.center)
					
					Spacer()
					
					if name == "" {
						Button("Continuar") {
							alertWillPresent.toggle()
						}
						.frame(width: 361, height: 44)
						.font(.custom("SF Pro", size: 20))
						.fontWeight(.semibold)
						.foregroundStyle(colorScheme == .light ? Color.white : Color("NewPeach"))
						.background(colorScheme == .light ? Color("NewPurple") : Color.white)
						.cornerRadius(8)
						.padding(.bottom, 100)
						.alert("Por favor, informe seu nome!", isPresented: $alertWillPresent) {
							Button("Ok") { }
						}
					} else {
						NavigationLink("Continuar") {
							TagView(name: name, sheetIsPresented: $sheetIsPresented)
						}
						.buttonStyle(SecondaryPlainButtonStyle())
						.padding(.bottom, 100)
					}
				}
			}
			.ignoresSafeArea()
		}
	}
}

