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
		GridItem(.adaptive(minimum: 100, maximum: 150)),
		GridItem(.adaptive(minimum: 100, maximum: 150)),
		GridItem(.adaptive(minimum: 100, maximum: 150)),
		GridItem(.adaptive(minimum: 100, maximum: 150))
	]
	
	let acctags = [""]
	let hobbytags = [""]
	
	var body: some View {
		NavigationStack {
			ScrollView {
				VStack(alignment: .leading) {
					
					HStack {
						
						VStack {
							Image(vm.profiles[0].imagename ?? "sabainigabriel")
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
					
//					Text("Hobbies")
//						.font(.custom("SF Pro", size: 20))
//						.bold()
					
					Text("Identificação")
						.font(.custom("SF Pro", size: 20))
						.bold()
					
					
					LazyVGrid(columns: columns) {
						ForEach(vm.profiles) { profile in
							ForEach(profile.tags) { tag in
								Text("\(tag.num)")
									.padding(.horizontal)
									.padding(.vertical, 5)
									.background(Color("DarkBlue"))
									.clipShape(RoundedRectangle(cornerRadius: 10))

							}
						}
					}
					
//					List {
//						ForEach(vm.profiles) { profile in
//							ForEach(profile.tags) { tag in
//								Text("\(tag.num)")
//							}
//						}
//					}
					
					
					Text("Meus Eventos")
						.font(.custom("SF Pro", size: 20))
						.bold()
					
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
