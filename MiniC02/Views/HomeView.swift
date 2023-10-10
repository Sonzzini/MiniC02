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
				
				Subtitle
				
				SegmentedControlView(selectedIndex: $selectedIndex, titles: screens)
					.padding(.bottom)

				if selectedIndex == 0 {
					HomeFeedView()
				} else {
					HomePresenceView()
				}
			}
			.navigationTitle("Hoje")
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
						else {
							Image(systemName: "person")
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
