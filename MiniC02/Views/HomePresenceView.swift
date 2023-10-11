//
//  HomePresenceView.swift
//  MiniC02
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 09/10/23.
//

import SwiftUI

struct HomePresenceView: View {
	
	@EnvironmentObject var vm : ViewModel
	@EnvironmentObject var eventC : EventCRU
	@State var eventsPresence: [EventModel] = []
	
	var body: some View {
		NavigationStack {
			ScrollView {
				
				VStack {
					if eventsPresence.isEmpty {
						VStack {
							Image("Frown")
								.padding(.bottom, 50)
							
							Text("Nenhum evento...")
						}
						.padding(.top, 100)
					}
					
					ForEach(eventsPresence) { event in
						EventCard(event: event, salvo: true)
					}
					
				}
				.frame(maxWidth: .infinity)
				.padding(.top)
				
			}

			.onAppear {
				eventC.getEvents()
				vm.getIDs()
				
				eventsPresence = []
				for id in vm.ids {
					for event in eventC.events {
						if event.id == id.id {
							eventsPresence.append(event)
							print(event.title)
						}
					}
				}
				eventsPresence.reverse()
				
			}

			
			
		}

	}
}


#Preview {
	HomePresenceView()
}
