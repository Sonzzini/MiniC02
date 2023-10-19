//
//  DeleteConfirmationView.swift
//  MiniC02
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 19/10/23.
//

import SwiftUI

struct DeleteConfirmationView: View {
	
	@Environment(\.dismiss) private var dismiss
	@EnvironmentObject var vm : ViewModel
	@State var deleteAccountUsername = ""
	@Binding var recadastrarSheetIsPresented: Bool
	
	var body: some View {
		NavigationStack {
			ScrollView {
				
				VStack {
					Text("Tem certeza que deseja continuar?")
						.font(.title2)
						.bold()
					
					Text("Digite o seu nome de usuário para confirmar")
						.font(.title3)
						.padding(.leading)
						.multilineTextAlignment(.center)
						
					
					
				}
				.padding(.top, 20)
				
				PrettyTextField(localizedString: "nome de usuário", text: $deleteAccountUsername)
					.padding()
				
			}
			.navigationBarBackButtonHidden(true)
			
			.toolbar {
				ToolbarItem(placement: .cancellationAction) {
					Button {
						dismiss()
					} label: {
						HStack {
							Image(systemName: "chevron.left")
							Text("Cancelar")
						}
						.foregroundStyle(Color("DarkBlue"))
					}

					
				}
				
				ToolbarItem(placement: .confirmationAction) {
					Button(role: .destructive) {
						dismiss()
						recadastrarSheetIsPresented.toggle()
					} label: {
						Text("Deletar conta")
							.foregroundStyle(.red)
					}
					.disabled(deleteAccountUsername != vm.profiles[0].username)
					
				}
			}
			
			
			
		}
		
		
		
		
		
	}
	
	
}
