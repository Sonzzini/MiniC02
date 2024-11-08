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
	@Published var confirmedIDs: [EventConfirmedPresenceIDs] = []
	@Published var controller: [Controller] = []
	@Published var context: NSManagedObjectContext
	
	
	init() {
		self.context = CoreDataController.shared.viewContext
		getTags()
		getProfile()
		getIDs()
		getConfirmedIDs()
	}
	
	func getProfile() {
		profiles = CoreDataController.shared.getProfile()
	}
	
	func getTags() {
		tags = CoreDataController.shared.getTags()
	}
	
	func getConfirmedIDs() {
		confirmedIDs = CoreDataController.shared.getConfirmedIDs()
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
			firstLoginSheetIsPresented = true
			
			let controller = Controller(context: context)
			controller.firstLogin = true
			
			self.controller = [controller]
			
			try? context.save()
		}
		
		guard let controller = controller.first else { return }
		if controller.firstLogin {
			firstLoginSheetIsPresented = true
		}
		
	}
	//
	//	func setupController() {
	//		getController()
	//
	//		if controller.isEmpty {
	//			let controller = Controller(context: context)
	//			controller.firstLogin = true
	//
	//			self.controller = [controller]
	//
	//			try? context.save()
	//		}
	//	}
	
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
			
			for id in ids {
				context.delete(id)
			}
			for confirmedID in confirmedIDs {
				context.delete(confirmedID)
			}
			
			
			do {
				try context.save()
			} catch {
				print("Error saving profile")
			}
		}
	}
	
	func updateProfile(name: String, tags:[String]) {
		getProfile()
		
		if !profiles.isEmpty {
			context.delete(self.profiles[0])
			for tag in self.tags {
				context.delete(tag)
			}
			try? context.save()
			
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
					print("Error relating new tags to profile: \(error.localizedDescription)")
				}
				
				self.profiles = [profile]
				
				try? context.save()
			}
		}
		
		
	}
	
	func saveEventToProfile(event: EventModel) {
		getProfile()
		
		if !profiles.isEmpty {
			let eventObj = EventPresenceIDs(context: context)
			eventObj.id = event.id
			eventObj.date = Date.now
			eventObj.eventIDstoProfile = profiles[0]
			
			try? context.save()
			
			ids.insert(eventObj, at: 0)
		}
	}
	
	func unsaveEventFromProfile(event: EventModel) {
		getProfile()
		
		if !profiles.isEmpty {
			let eventId = event.id
			for id in ids {
				if id.id == eventId {
					print(id.id ?? "ID")
					context.delete(id)
					
					try? context.save()
				}
			}
		}
		
	}
	
	
	func saveConfirmedEventToProfile(event: EventModel) {
		getProfile()
		
		if !profiles.isEmpty {
			let eventObj = EventConfirmedPresenceIDs(context: context)
			eventObj.id = event.id
			eventObj.date = Date.now
			eventObj.confirmedEventsToProfile = profiles[0]
			
			try? context.save()
			
			confirmedIDs.insert(eventObj, at: 0)
		}
	}
	
	func unsaveConfirmedEventFromProfile(event: EventModel) {
		getProfile()
		
		if !profiles.isEmpty {
			let eventId = event.id
			for id in confirmedIDs {
				if id.id == eventId {
					context.delete(id)
					
					try? context.save()
				}
			}
		}
	}
	
	
}
