//
//  ViewModel.swift
//  MiniC02
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 19/09/23.
//
import UIKit
import Foundation
import SwiftUI
import CoreData
// Ponte entre a View e o Model (instancia as coisas que as Views recebem)

class ViewModel: ObservableObject {
	
	@Published var profiles: [Profile] = []
	@Published var tags: [Tag] = []
	@Published var ids: [EventPresenceIDs] = []
	@Published var controller: [Controller] = []
	@Published var context: NSManagedObjectContext
	
	
	init() {
		self.context = CoreDataController.shared.viewContext
		getTags()
		getProfile()
		getIDs()
	}
	
	func getProfile() {
		profiles = CoreDataController.shared.getProfile()
	}
	
	func getTags() {
		tags = CoreDataController.shared.getTags()
	}
	
	func getIDs() {
		ids = CoreDataController.shared.getIDs()
	}
	
	func getController() {
		controller = CoreDataController.shared.getController()
	}
	
	func DELETECOREDATA() {
		CoreDataController.shared.DELETEALL()
	}
	
	func setupController(firstLoginSheetIsPresented: inout Bool) {
		getController()
		
		if controller.isEmpty {
			firstLoginSheetIsPresented.toggle()
			
			let controller = Controller(context: context)
			controller.firstLogin = false
			
			self.controller = [controller]
			
			try? context.save()
		}

		
	}
	
	func removeWhitespacesFromString(mStr: String) -> String {
		 let filteredChar = mStr.filter { !$0.isWhitespace }
		 return String(filteredChar)
	}
	
	func setupProfile(name: String, tags: [String]) {
		getProfile()
		
		if profiles.isEmpty {
			
			let profile = Profile(context: context)
			profile.imagename = name
			profile.name = name
			profile.username = removeWhitespacesFromString(mStr: name).lowercased()
			profile.profileid = UUID()
			
			for tag in tags {
				let tagObj = Tag(context: context)
				tagObj.name = tag
				
				do {
					tagObj.tagToProfile = profile
					try context.save()
				} catch {
					print("Error relating tag to profile: \(error.localizedDescription)")
				}
				
			}
			
			

			self.profiles = [profile]
			
			do {
				try context.save()
			} catch {
				print("Error saving profile")
			}
		}
	}
	
	func saveEventToProfile(event: EventModel) {
		getProfile()
		
		if !profiles.isEmpty {
			let eventObj = EventPresenceIDs(context: context)
			eventObj.id = event.id
			eventObj.eventIDstoProfile = profiles[0]
			
			try? context.save()
			
			ids.insert(eventObj, at: 0)
		}
	}
	
	func removeEventFromProfile() {}
}
