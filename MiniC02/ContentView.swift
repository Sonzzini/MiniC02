//
//  ContentView.swift
//  MiniC02
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 22/08/23.
//

import SwiftUI

struct ContentView: View {
	
	@Environment(\.managedObjectContext) var moc
	
	@EnvironmentObject var eventC : EventCRU
	@EnvironmentObject var vm : ViewModel
	
	
    var body: some View {
		 NavigationStack {
			 NavigationLink(destination: EventPostView()) {
				 Text("Go to event post view")
			 }
			 List {
				 ForEach(eventC.events) { event in
					 Text("\(event.id)")
					 Text(event.event.title)
					 Text(event.event.location)
						 .padding(.bottom)
				 }
			 }
			 .onAppear {
				 eventC.getEvents()
			 }
		 }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
			 .environmentObject(EventCRU())
    }
}
