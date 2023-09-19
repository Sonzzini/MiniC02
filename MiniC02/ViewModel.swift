//
//  ViewModel.swift
//  MiniC02
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 19/09/23.
//

import Foundation
import SwiftUI

class ViewModel: ObservableObject {
	@Published var users: [User]
	
	init() {
		self.users = [
			User(name: "Dondetos",
				  username: "paulosonzzini",
				  Image: "PauloProfilePic",
				  tags: [Tag(identifier: "1"), Tag(identifier: "2")]),
			User(name: "lau b.",
				  username: "laurinha",
				  Image: "LauraProfilePic",
				  tags: [Tag(identifier: "1"), Tag(identifier: "3")])
		]
	}
	
	func addUser(user: User) {
		self.users.append(user)
	}

	
}
