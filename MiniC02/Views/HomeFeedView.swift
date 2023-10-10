//
//  HomeFeedView.swift
//  MiniC02
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 09/10/23.
//

import SwiftUI

struct HomeFeedView: View {
	
	@Environment(\.managedObjectContext) var moc
	
	@EnvironmentObject var eventC : EventCRU
	@EnvironmentObject var vm : ViewModel
	
	@State var firstLoginSheetIsPresented: Bool = false
	
	var body: some View {
		NavigationStack {
			ScrollView {
				
				
				ForEach(eventC.events) { event in
					EventCard(event: event)
						.padding(.bottom)
				}
				
			}
			.onAppear {
				
				eventC.getEvents()
				
				vm.setupController(firstLoginSheetIsPresented: &firstLoginSheetIsPresented)
				
			}
			
		}
		.fullScreenCover(isPresented: $firstLoginSheetIsPresented) {
			TutorialView(sheetIsPresented: $firstLoginSheetIsPresented)
		}
		
	}
}

#Preview {
	HomeFeedView()
}

