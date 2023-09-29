//
//  EventPostView.swift
//  MiniC02
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 27/09/23.
//

import SwiftUI

struct EventPostView: View {
	
	@Environment(\.dismiss) private var dismiss
	
	@State private var title: String = "" // ON
	@State private var desc: String = "" // OFF
	@State private var date: String = "" // ON
	@State private var time: String = "" // ON
	@State private var location: String = "" // ON
	@State private var neighborhood: String = "" // ON
	@State private var hostname: String = "" // OFF
	
	
	@EnvironmentObject var eventC: EventCRU
	
	var body: some View {
		NavigationStack {
			Form {
				
				Section {
					Button(action: {
						print("AAAAAA")
					}, label: {
						Image(systemName: "plus")
					})
				} header: {
					Text("Coloque uma foto/vídeo!")
				}
				
				Section {
					TextField("Nome do seu Evento", text: $title)
					TextField("Data", text: $date)
					TextField("Horário", text: $time)
					TextField("Local", text: $location)
					TextField("Bairro", text: $neighborhood)
				} header: {
					Text("Informações")
				}
				
			}
			.toolbar {
				ToolbarItem(placement: .principal) {
					Text("Novo Evento")
				}
				ToolbarItem(placement: .confirmationAction) {
					Button("Criar") {
						let event = EventModel(id: 0, event: EventModel.Event(title: title, desc: desc, date: date, time: time, location: location, neighborhood: neighborhood, hostname: hostname))
						eventC.postEvent(event: event)
						dismiss()
					}
				}
			}
		}
		
	}
}

#Preview {
	EventPostView()
		.environmentObject(EventCRU())
}
