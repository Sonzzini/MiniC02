//
//  ProfileView.swift
//  MiniC02
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 04/10/23.
//

import SwiftUI

struct ProfileView: View {
	
	@EnvironmentObject var vm : ViewModel
	
	var body: some View {
		NavigationStack {
			ScrollView {
				
				HStack {
					
					Image(vm.profiles[0].imagename ?? "sabainigabriel")
					
					VStack {
						
						Text(vm.profiles[0].name ?? "sabainigabriel")
						
						Text("@" + (vm.profiles[0].username ?? "sabainigabriel"))
						
					}
					
				}
				
				Text("Hobbies")
				
				Text("Identificação")
				
				Text("Meus Eventos")
				
			}
			
		}
		
		
		
	}
}

#Preview {
	ProfileView()
}
