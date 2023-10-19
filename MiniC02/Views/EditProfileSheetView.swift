//
//  EditProfileSheetView.swift
//  MiniC02
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 19/10/23.
//

import SwiftUI

struct EditProfileSheetView: View {
	
	@Environment(\.dismiss) private var dismiss
	
	@EnvironmentObject var vm : ViewModel
	@State var username: String = ""
	@State var name: String = ""
	
	var body: some View {
		NavigationStack {
			ScrollView {
				
				Image(vm.profiles[0].imagename ?? "")
					.resizable()
					.scaledToFit()
					.frame(width: 100, height: 100)
					.clipShape(Circle())
					.padding(.top, 20)
				
				VStack(alignment: .leading) {
					Text("Nome")
					PrettyTextField(localizedString: "Seu nome", text: $name)
						.padding(.bottom)
					
					Text("Usuário")
					PrettyTextField(localizedString: "Seu nome de usuário", text: $username)
						.padding(.bottom)

					ForEach(vm.profiles[0].tags) { tag in
						Text(tag.name!)
					}
					
				}
				
			}
			.padding(.horizontal)
			
			.onAppear {
				username = vm.profiles[0].username ?? ""
				name = vm.profiles[0].name ?? ""
			}
			
			.toolbar {
				ToolbarItem(placement: .cancellationAction) {
					Button {
						dismiss()
					} label: {
						Text("Cancelar")
							.foregroundStyle(Color("DarkBlue"))
					}

				}
				
				ToolbarItem(placement: .confirmationAction) {
					Button {
						vm.profiles[0].name = name
						vm.profiles[0].username = username
						
						try? vm.context.save()
						
						dismiss()
					} label: {
						Text("Salvar")
							.foregroundStyle(.green)
					}

				}
			}
		}
		// on dissapear { all sheets go to false }
	}
}

