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
	let profilePicNames = ["biamoura_oficial", "Gabriel Fonseca", "gabrielk29", "Paulo Sonzzini", "paulosonzzini", "sabainigabriel"]
	@State var isInPFPNames: Bool = false
	@State var selectedIndex: Int = 0
	@State var firstLoginSheetIsPresented = false
	let date = Date.now
	
//	init() {
		//		Aptabase.shared.trackEvent("app_started")
		//		Aptabase.shared.trackEvent("screen_view", with: ["name": "Settings"])
//	}
	
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
					HomeFeedView(firstLoginSheetIsPresented: $firstLoginSheetIsPresented)
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
					NavigationLink(destination: ProfileView(profilePicNames: profilePicNames, isInPFPNames: $isInPFPNames)) {
						
						if !vm.profiles.isEmpty && isInPFPNames {
							Image(vm.profiles[0].imagename ?? "Paulo Sonzzini")
								.resizable()
								.scaledToFit()
								.frame(width: 25)
								.clipShape(Circle())
						} else {
							Image(systemName: "person")
								.foregroundColor(Color("DarkBlue"))
						}
						
					}
				}
			}
		}
		
		.onAppear {
			
			vm.setupController(firstLoginSheetIsPresented: &firstLoginSheetIsPresented)
			
			UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color("DarkBlue"))]
			UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color("DarkBlue"))]
			
			if !vm.profiles.isEmpty {
				
				for img in profilePicNames {
					if img == vm.profiles[0].imagename {
						isInPFPNames = true
					}
				}
				
			}
			
		}
		
	}
	
}


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
