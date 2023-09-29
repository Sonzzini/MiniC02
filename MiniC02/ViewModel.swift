//
//  ViewModel.swift
//  MiniC02
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 19/09/23.
//

import Foundation
import SwiftUI
import CoreData
// Ponte entre a View e o Model (instancia as coisas que as Views recebem)

class ViewModel: ObservableObject {
//	@Published var users: [User]
//	
//	init() {
//		self.users = [
//			User(name: "Dondetos",
//				  username: "paulosonzzini",
//				  Image: "PauloProfilePic",
//				  tags: [Tag(identifier: "1"), Tag(identifier: "2")]),
//			User(name: "lau b.",
//				  username: "laurinha",
//				  Image: "LauraProfilePic",
//				  tags: [Tag(identifier: "1"), Tag(identifier: "3")])
//		]
//	}
//	
//	func addUser(user: User) {
//		self.users.append(user)
//	}
	
	@Published var profiles: [Profile] = []
	@Published var controller: [Controller] = []
	@Published var context: NSManagedObjectContext
	
	init() {
		self.context = CoreDataController.shared.viewContext
	}
	
	func getProfile() {
		profiles = CoreDataController.shared.getProfile()
	}
	
	func getController() {
		controller = CoreDataController.shared.getController()
	}
	
	func DELETECOREDATA() {
		CoreDataController.shared.DELETEALL()
	}
	
}
