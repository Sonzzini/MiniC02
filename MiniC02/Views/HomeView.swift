//
//  HomeView.swift
//  MiniC02
//
//  Created by Gabriel Sabaini on 19/09/23.
//

import SwiftUI
import UIKit
import Aptabase

struct HomeView: View {
	
	@EnvironmentObject var vm : ViewModel
	@EnvironmentObject var eventC : EventCRU
	let screens = ["Feed", "Presença"]
	@State var selectedIndex: Int = 0
	let date = Date.now
	
	init() {
		//		Aptabase.shared.trackEvent("app_started")
		//		Aptabase.shared.trackEvent("screen_view", with: ["name": "Settings"])
	}
	
	var body: some View {
		NavigationStack {

			ScrollView {

				VStack(alignment: .leading) {
					
					Text("Hoje")
						.font(.largeTitle)
						.bold()
						.foregroundStyle(Color("DarkBlue"))
						.padding(.leading)
					
					Subtitle
					
					SegmentedControlView(selectedIndex: $selectedIndex, titles: screens)
						.padding(.bottom, -8)
				
				}


				
				if eventC.events.isEmpty {
					Text("Carregando eventos...")
						.padding(.top, 250)
				}
				
				if selectedIndex == 0 {
					HomeFeedView()
				} else {
					HomePresenceView()
				}
				
				
			}

			.toolbar {
				ToolbarItem(placement: .topBarTrailing) {
					NavigationLink(destination: EventPostView()) {
						Image(systemName: "plus")
							.foregroundStyle(Color("DarkBlue"))
					}
				}
				
				ToolbarItem(placement: .topBarTrailing) {
					NavigationLink(destination: ProfileView()) {
						
						if !vm.profiles.isEmpty {
							Image(vm.profiles[0].imagename ?? "sabainigabriel")
						}
//						if (vm.profiles[0].imagename ?? "") not in assets
						else {
							Image(systemName: "person")
								.foregroundColor(Color("DarkBlue"))
						}
					}
				}
			}
		}
		
		.onAppear {
			UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color("DarkBlue"))]
			UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color("DarkBlue"))]
		}
		
	}
	
}

//#Preview {
//		HomeView()
//			.environmentObject(EventCRU())
//}


extension HomeView {
	
	private var Subtitle: some View {
		HStack {
			Text(date, style: .date)
				.foregroundStyle(Color("DarkYellow"))
				.font(.system(size: 27, weight: .semibold))
				.padding(.horizontal)
			
			Spacer()
		}
		.environment(\.locale, Locale(identifier: "pt"))
	}
}
