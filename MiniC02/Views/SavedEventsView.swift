//
//  SavedEventsView.swift
//  MiniC02
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 17/10/23.
//

import SwiftUI

struct SavedEventsView: View {
	
	@Environment(\.dismiss) private var dismiss
	
	@EnvironmentObject var vm : ViewModel
	@EnvironmentObject var eventC : EventCRU
	
	@State var events: [EventModel] = []
	
	var body: some View {
		NavigationStack {
			ScrollView {
				
				if events.isEmpty {
					VStack {
						Image("EmptyIcon")
							.resizable()
							.scaledToFit()
							.frame(width: 150)
						
						Text("Nenhum evento...")
							.font(.title3)
							.bold()
							.foregroundStyle(Color("EmptyColor"))
							
					}
					.padding(.top, 100)
					
				} else {
					
					ForEach(events) { event in
						EventCard(event: event, salvo: true)
							.padding(.bottom)
					}
					.padding(.top)
				}
				
			}
			.onAppear {
				events = []
				eventC.getEvents()
				
				for id in vm.ids {
					for event in eventC.events {
						if event.id == id.id {
							events.append(event)
						}
					}
				}
				
			}
			.navigationBarBackButtonHidden(true)
			
			.toolbar {
				ToolbarItem(placement: .cancellationAction) {
					Button {
						dismiss()
					} label: {
						HStack {
							Image(systemName: "chevron.left")
							Text("Perfil")
						}
						.foregroundStyle(Color("DarkBlue"))
					}
					
				}
				
				ToolbarItem(placement: .principal) {
					 Text("Favoritos")
						  .font(
								Font.custom("SF Pro", size: 20)
									 .weight(.semibold)
						  )
						  .foregroundStyle(Color("DarkYellow"))
				}
			}
		}
		
		
	}
}
