//
//  MiniC02App.swift
//  MiniC02
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 22/08/23.
//

import SwiftUI
import Aptabase

@main
struct MiniC02App: App {
	
	init() {
		Aptabase.shared.initialize(appKey: "A-EU-1168506422") // 👈 this is where you enter your App Key
	}
	
	@StateObject private var viewModel = ViewModel()
	var eventC = EventCRU()
	
	var body: some Scene {
		WindowGroup {
			HomeView()
				.environment(\.managedObjectContext, CoreDataController.shared.viewContext)
				.environmentObject(viewModel)
				.environmentObject(eventC)
		}
	}
}
