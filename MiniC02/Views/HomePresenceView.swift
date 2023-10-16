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
	@State var eventStatus: [Int] = []
	
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
					
					ForEach(Array(eventsPresence.enumerated()), id:\.offset) { index, event in
						EventCard(event: event, EuVou: true)
						
					}
					
				}
				.frame(maxWidth: .infinity)
				.padding(.top)
				.padding(.bottom, 20)
				
			}
			
			.onAppear {
				eventC.getEvents()
				vm.getIDs()
				
				eventsPresence = []
				
//				for id in vm.ids {
//					for event in eventC.events {
//						if event.id == id.id {
//							eventsPresence.append(event)
//							eventStatus.append(0) // MARK: 0 = BOOKMARK
//							print(event.title)
//						}
//					}
//				}
				
				for id in vm.confirmedIDs {
					for event in eventC.events {
						if event.id == id.id {
							eventsPresence.append(event)
							eventStatus.append(1) // MARK: 1 = EU VOU!
							print(event.title)
						}
					}
				}
				
				//				eventsPresence.sort(by: {$0.date.compare($1.date) == .orderedDescending})
				//				eventsPresence.sort
				
			}
			
			
			
		}
		
	}
}


#Preview {
	HomePresenceView()
}
