//
//  User.swift
//  MiniC02
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 19/09/23.
//

import Foundation
import SwiftUI
// Declarações

class User {
	
	internal init(name: String, username: String, Image: String, tags: [Tag]) {
		self.name = name
		self.username = username
		self.Image = Image
		self.tags = tags
	}
	
	let id = UUID()
	let name: String
	let username: String
	let Image: String
	let tags: [Tag]
	
}
