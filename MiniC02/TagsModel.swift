//
//  TagsModel.swift
//  MiniC02
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 19/09/23.
//

import Foundation

class Tag {
	
	internal init(identifier: String) {
		self.identifier = identifier
	}
	
	let id = UUID()
	let identifier: String
}
