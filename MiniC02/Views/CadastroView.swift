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
    
	var body: some View {
		NavigationStack {
			VStack {
				Image("hiLibras")
					.resizable()
					.frame(width: 129, height: 134.7)
					.padding(.bottom, 24)
				
				Text("Vamos começar, qual é o seu nome?")
					.font(.custom("SF Pro", size: 19))
					.fontWeight(.semibold)
					.padding(.bottom, 35)
				
				TextField("Seu Nome", text: $name)
					.font(.custom("SF Pro", size: 28))
					.fontWeight(.bold)
					.multilineTextAlignment(.center)
				
				if name == "" {
					Button("Continuar") {
						print()
					}
					.frame(width: 361, height: 44)
					.font(.custom("SF Pro", size: 20))
					.fontWeight(.semibold)
					.foregroundColor(.black)
					.background(Color("LightBlue"))
					.cornerRadius(8)
					.disabled(true)
					.padding(.top, 357)
				} else {
					NavigationLink("Continuar") {
						TagView(name: name)
					}
					.buttonStyle(PlainButtonStyle())
					.padding(.top, 357)
				}
			}
		}
	}
}

#Preview {
	CadastroView()
}
