//
//  TagView.swift
//  MiniC02
//
//  Created by Laura C. Balbachan dos Santos on 03/10/23.
//

import SwiftUI

struct TagView: View {
	@State private var tags: [Int] = []
	@State private var showingSheet = false
	var name: String
	
	@EnvironmentObject var vm : ViewModel
	
	var body: some View {
		NavigationStack {
			VStack {
				Image("hiLibras")
                    .resizable()
                    .frame(width: 129, height: 134.7)
                    .padding(.bottom, 24)
                
                Text("Selecione as tags que você se identifica:")
                    .font(.custom("SF Pro", size: 19))
                    .fontWeight(.semibold)
                    .padding(.bottom, 30)
                
                Text("Essas tags irão aparecer em seu perfil")
                    .font(.custom("SF Pro", size: 16))
                    .fontWeight(.semibold)
                    .foregroundStyle(Color("LightGray"))
				
                
                
                
				Button("Continuar") {
					// MARK: mudar as tags para as tags la de cima, e nao hardcoded
					vm.setupProfile(name: name, tags: [1, 2, 3]) // essas tags
				}
				.buttonStyle(PlainButtonStyle())
				
                
				
				
			}
			.toolbar {
				ToolbarItem(placement: .automatic) {
					Button {
						showingSheet.toggle()
					} label: {
						Image(systemName: "info.circle.fill")
							.foregroundStyle(Color("DarkBlue"))
					}
					.sheet(isPresented: $showingSheet) {
						TagInformationView()
					}
				}
				
				
			}
		}
	}
}


#Preview {
	TagView(name: "Paulo Sonzzini")
}
