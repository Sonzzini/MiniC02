
//
//  ProfileView.swift
//  MiniC02
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 04/10/23.
//

import SwiftUI

struct ProfileView: View {
	
	@EnvironmentObject var vm : ViewModel
	@EnvironmentObject var eventC : EventCRU
	@Environment(\.dismiss) private var dismiss
	
	@State var yourEventsList: [EventModel] = []
	
	@State var sheetIsPresented = false
	@State var editProfileSheetIsOpened: Bool = false
	@State var deleteAccountButton = false
	
	@State var recadastrarSheetIsPresented = false
	
	@State var columns: [GridItem] = [
		GridItem(.adaptive(minimum: 150, maximum: 550)),
		GridItem(.adaptive(minimum: 150, maximum: 550)),
		GridItem(.adaptive(minimum: 150, maximum: 550)),
		GridItem(.adaptive(minimum: 150, maximum: 550))
	]
	
	let acctags = [""]
	let hobbytags = [""]
	
	let profilePicNames: [String]
	@Binding var isInPFPNames: Bool
	
	var body: some View {
		NavigationStack {
			ScrollView {
				VStack(alignment: .leading) {
					
					header
					
					identification
						.padding(.bottom)
					
					yourEvents
					
				}
				.padding(.horizontal, 20)
				
				
			}
			.toolbar {
				ToolbarItem(placement: .cancellationAction) {
					backButton
				}
				
				ToolbarItem(placement: .topBarTrailing) {
					NavigationLink {
						SavedEventsView()
					} label: {
						Image(systemName: "bookmark")
							.foregroundStyle(Color("DarkBlue"))
					}
					
				}
				
				ToolbarItem(placement: .topBarTrailing) {
					sheetViewButton
				}
			}
			.alert("Tem certeza que deseja continuar?", isPresented: $deleteAccountButton) {
				Button("Cancelar", role: .cancel) { }
				
				NavigationLink {
					DeleteConfirmationView(recadastrarSheetIsPresented: $recadastrarSheetIsPresented)
				} label: {
					Text("Deletar conta")
						.foregroundStyle(.red)
				}
				
				
			}
		}
		.navigationBarBackButtonHidden(true)
		
		
		.sheet(isPresented: $sheetIsPresented) {
			ProfileSheetView( deleteAccountButton: $deleteAccountButton, editProfileSheetIsOpened: $editProfileSheetIsOpened)
				.presentationDetents([.medium])
		}
		.sheet(isPresented: $editProfileSheetIsOpened) {
			EditProfileSheetView()
		}
		
		.fullScreenCover(isPresented: $recadastrarSheetIsPresented) {
			CadastroView(sheetIsPresented: $recadastrarSheetIsPresented)
		}
		
		
		
		
		
	}
}


extension ProfileView {
	
	private var header: some View {
		VStack(alignment: .leading) {
			HStack(alignment: .top) {
				
				if isInPFPNames {
					Image("Paulo Sonzzini")
						.resizable()
						.scaledToFit()
						.frame(width: 100, height: 100)
						.clipShape(Circle())
				} else {
					Image(systemName: "person")
						.resizable()
						.scaledToFit()
						.frame(width: 100, height: 100)
						.foregroundStyle(Color("DarkBlue"))
				}
				
				VStack(alignment: .leading) {
					Text(vm.profiles[0].name ?? "User")
						.font(.custom("SF Pro", size: 35))
						.bold()
					
					Text("@" + (vm.profiles[0].username ?? "user"))
						.foregroundStyle(.secondary)
				}
			}
		}
	}
	
	private var identification: some View {
		VStack(alignment: .leading) {
			Text("Identificação")
				.font(.custom("SF Pro", size: 20))
				.bold()
			
			ForEach(vm.profiles) { profile in
				ForEach(profile.tags) { tag in
					Text(tag.name ?? "laur")
						.padding(.horizontal)
						.padding(.vertical, 5)
						.background(Color("DarkBlue"))
						.clipShape(RoundedRectangle(cornerRadius: 10))
					
				}
			}
		}
	}
	
	private var yourEvents: some View {
		VStack(alignment: .leading, spacing: -5) {
			HStack {
				Text("Meus Eventos")
					.font(.custom("SF Pro", size: 20))
					.bold()
					.onAppear {
						yourEventsList = []
						for event in eventC.events {
							if event.hostname == vm.profiles[0].username {
								yourEventsList.append(event)
							}
						}
					}
				Spacer()
			}
			
			ForEach(yourEventsList) { event in
				EventCard(event: event, onYourProfile: true)
					.padding(.vertical)
			}
		}
	}
	
	private var backButton: some View {
		Button(action: {
			dismiss()
		}, label: {
			HStack {
				Image(systemName: "chevron.left")
				Text("Início")
			}
			.foregroundStyle(Color("DarkBlue"))
		})
	}
	
	private var sheetViewButton: some View {
		Button(action: {
			sheetIsPresented.toggle()
		}) {
			Image(systemName: "ellipsis")
				.foregroundStyle(Color("DarkBlue"))
		}
	}
}
