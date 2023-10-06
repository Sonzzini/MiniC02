//
//  HomeView.swift
//  MiniC02
//
//  Created by Gabriel Sabaini on 19/09/23.
//

import SwiftUI
import UIKit

struct HomeView: View {
	
	@Environment(\.managedObjectContext) var moc
	
	@EnvironmentObject var eventC : EventCRU
	@EnvironmentObject var vm : ViewModel
	
	@State var firstLoginSheetIsPresented: Bool = false
	
	let date = Date.now

	var body: some View {
		NavigationStack {
			ScrollView {
				
				Subtitle
				
				ForEach(eventC.events) { event in
					EventCard(event: event)
						.padding(.bottom)
				}
			}
			.onAppear {
				
				eventC.getEvents()
				
				vm.setupController(firstLoginSheetIsPresented: &firstLoginSheetIsPresented)
				
				
				UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color("DarkBlue"))]
				UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color("DarkBlue"))]

				
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
		.fullScreenCover(isPresented: $firstLoginSheetIsPresented) {
			TutorialView(sheetIsPresented: $firstLoginSheetIsPresented)
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
