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
	//a
	
    var body: some View {
		 NavigationStack {
			 NavigationLink(destination: EventPostView()) {
				 Text("Go to event post view")
			 }
			 List {
				 ForEach(eventC.events) { event in
					 Text("\(event.id ?? "ops")")
					 Text(event.title)
					 Text(event.location)
						 .padding(.bottom)
					 Image(event.imagename)
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
