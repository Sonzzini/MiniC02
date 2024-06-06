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
	
	@Binding var firstLoginSheetIsPresented: Bool
	
	var body: some View {
		NavigationStack {
			ScrollView {
				VStack(spacing: 0) {
					
					
					ForEach(eventC.events.reversed()) { event in
						NewEventCard(event: event)
							.padding(.bottom, 32)
						
					}
					
					
				}
				.frame(maxWidth: .infinity)
				.padding(.top)
				.background(.clear)
				
				
				
			}
			
			
			.onAppear {
				
				eventC.getEvents()
				
				
			}
			
		}
		
		.fullScreenCover(isPresented: $firstLoginSheetIsPresented) {
			TutorialView(sheetIsPresented: $firstLoginSheetIsPresented)
		}
		
	}
}
