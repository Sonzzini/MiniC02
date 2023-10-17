//
//  SavedEventsView.swift
//  MiniC02
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 17/10/23.
//

import SwiftUI

struct SavedEventsView: View {
	
	@EnvironmentObject var vm : ViewModel
	@EnvironmentObject var eventC : EventCRU
	
	
	
	var body: some View {
		NavigationStack {
			ScrollView {
				ForEach()
			}
		}
		
		
	}
}
