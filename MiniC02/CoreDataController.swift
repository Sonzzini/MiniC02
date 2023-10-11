//
//  CoreDataController.swift
//  MiniC02
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 28/09/23.
//
import CoreData
import Foundation

class CoreDataController: ObservableObject {
	
	static let shared = CoreDataController()
	var persistentContainer: NSPersistentContainer
	
	var viewContext: NSManagedObjectContext {
		return persistentContainer.viewContext
	}
	
	init(){
		persistentContainer = NSPersistentContainer(name: "CoreDataModel")
		
		persistentContainer.loadPersistentStores { description, error in
			if let error = error {
				print("Core Data failed to load: \(error.localizedDescription)")
			}
		}
	}
	
	func getProfile() -> [Profile] {
		let request = NSFetchRequest<Profile>(entityName: "Profile")
		
		do {
			return try viewContext.fetch(request)
		} catch {
			return []
		}
	}
	
	func getController() -> [Controller] {
		let request = NSFetchRequest<Controller>(entityName: "Controller")
		
		do {
			return try viewContext.fetch(request)
		} catch {
			return []
		}
	}
	
	func getTags() -> [Tag] {
		let request = NSFetchRequest<Tag>(entityName: "Tag")
		
		do {
			return try viewContext.fetch(request)
		} catch {
			return []
		}
	}
	
	func getIDs() -> [EventPresenceIDs] {
		let request = NSFetchRequest<EventPresenceIDs>(entityName: "EventPresenceIDs")
		
		do {
			return try viewContext.fetch(request)
		} catch {
			return []
		}
	}
	
	func DELETEALL() {
		let storeContainer = persistentContainer.persistentStoreCoordinator
		
		for store in storeContainer.persistentStores {
			do {
				try storeContainer.destroyPersistentStore(at: store.url!, ofType: store.type, options: nil)
			} catch {
				print("Error destroying CoreData")
			}
		}
		
		REINITIALIZE()
	}
	
	func REINITIALIZE() {
		persistentContainer = NSPersistentContainer(name: "CoreDataModel")
		
		persistentContainer.loadPersistentStores { description, error in
			if let error = error {
				print("Error reinitializing CoreData: ", error)
			}
		}
	}
	
}
