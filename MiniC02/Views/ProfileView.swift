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
	
	@State var yourEvents: [EventModel] = []
	
	@State var columns: [GridItem] = [
		GridItem(.adaptive(minimum: 150, maximum: 550)),
		GridItem(.adaptive(minimum: 150, maximum: 550)),
		GridItem(.adaptive(minimum: 150, maximum: 550)),
		GridItem(.adaptive(minimum: 150, maximum: 550))
	]
	
	let acctags = [""]
	let hobbytags = [""]
	
	var body: some View {
		NavigationStack {
			ScrollView {
				VStack(alignment: .leading) {
					
					HStack(alignment: .top) {
						
						VStack {
							Image(vm.profiles[0].imagename ?? "sabainigabriel")
								.resizable()
								.frame(width: 100, height: 100, alignment: .center)
							
							HStack {
								Image("InstagramIcon")
								Image("FacebookIcon")
							}
						}
						
						VStack(alignment: .leading) {
							
							Text(vm.profiles[0].name ?? "sabainigabriel")
								.font(.custom("SF Pro", size: 35))
								.bold()
							
							Text("@" + (vm.profiles[0].username ?? "sabainigabriel"))
								.foregroundStyle(.secondary)
							
						}
						
						
					}
					
					Text("Identificação")
						.font(.custom("SF Pro", size: 20))
						.bold()
					
					
//					LazyVGrid(columns: columns) {
						ForEach(vm.profiles) { profile in
							ForEach(profile.tags) { tag in
								Text(tag.name ?? "laur")
									.padding(.horizontal)
									.padding(.vertical, 5)
									.background(Color("DarkBlue"))
									.clipShape(RoundedRectangle(cornerRadius: 10))
								
							}
						}
//					}
					
					
					
					Text("Meus Eventos")
						.font(.custom("SF Pro", size: 20))
						.bold()
						.onAppear {
							for event in eventC.events {
								if event.hostname == vm.profiles[0].username {
									yourEvents.append(event)
								}
							}
						}
					
					ForEach(yourEvents) { event in
						EventCard(event: event, onYourProfile: true)
							.padding(.vertical)
					}
					
					
				}
				.padding(.horizontal)
				
			}
			.toolbar {
				ToolbarItem(placement: .cancellationAction) {
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
			}
		}
		.navigationBarBackButtonHidden(true)
		
		
		
	}
}

#Preview {
	ProfileView()
}
