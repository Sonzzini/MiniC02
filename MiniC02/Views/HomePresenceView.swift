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
				
				ForEach(eventsPresence) { event in
					EventCard(event: event)
				}
				
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
