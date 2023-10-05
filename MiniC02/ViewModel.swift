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
	
	func setupProfile(name: String, tags: [Int]) {
		getProfile()
		
		if profiles.isEmpty {
			
			let profile = Profile(context: context)
			profile.imagename = name
			profile.name = name
			profile.username = removeWhitespacesFromString(mStr: name).lowercased()
			profile.profileid = UUID()
			
			for number in tags {
				let tagObj = Tag(context: context)
				tagObj.num = Int16(number)
				
				profile.addToRelationship(tagObj)
			}
			
			

			self.profiles = [profile]
			
			try? context.save()
		}
	}
	
	
}
