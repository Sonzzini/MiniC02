//
//  SheetView.swift
//  MiniC02
//
//  Created by Gabriel Fonseca on 11/10/23.
//

import SwiftUI

struct ProfileSheetView: View {
	
	@Environment(\.dismiss) private var dismiss
	@State var teste = true
	@Binding var deleteAccountButton: Bool
	
	@State var recadastrarSheetIsPresented = false
	
	@EnvironmentObject var vm : ViewModel
	
	@Binding var editProfileSheetIsOpened: Bool
	
	var body: some View {
		NavigationStack {
			List {
				
				HStack{
					Image(systemName: "pencil")
					Text("Editar Perfil")
					
				}
				.onTapGesture {
					dismiss()
					editProfileSheetIsOpened = true
				}
				
				HStack{
					Image(systemName: "ladybug.fill")
					Link("Reportar um Problema", destination: URL(string: "https://airtable.com/appD46zZB7myjSdlK/shr8fthpV44OWR5GW")!)
				}
				.foregroundStyle(.blue)
				
				Section {
					Button {
						dismiss()
						DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
							deleteAccountButton = true
						}
					} label: {
						HStack {
							Image(systemName: "trash")
							Text("Excluir perfil")
						}
						.foregroundStyle(.red)
					}
					
					
					
					
				}
				
			}
			.listStyle(.insetGrouped)
			
//			Text("Sair")
//				.foregroundStyle(Color.red)
//				.onTapGesture {
//					dismiss()
//				}

			
		}
	}
}

