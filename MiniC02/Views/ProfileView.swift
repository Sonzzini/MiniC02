
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
					
					yourEvents
					
				}
				.padding(.horizontal, 20)

				
			}
			.toolbar {
				ToolbarItem(placement: .cancellationAction) {
					backButton
				}
				
				ToolbarItem(placement: .confirmationAction) {
					sheetViewButton
				}
			}
		}
		.navigationBarBackButtonHidden(true)
		
		
		.sheet(isPresented: $sheetIsPresented) {
			ProfileSheetView()
				.presentationDetents([.medium])
		}
		
		
		
	}
}


extension ProfileView {
	
	private var header: some View {
		VStack(alignment: .leading) {
			HStack(alignment: .top) {
				
				if isInPFPNames {
					Image(vm.profiles[0].imagename ?? "person")
						.resizable()
						.frame(width: 100, height: 100)
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
		VStack(alignment: .leading) {
			HStack {
				Text("Meus Eventos")
					.font(.custom("SF Pro", size: 20))
					.bold()
					.onAppear {
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
		}
	}
}
