//
//  EventModel.swift
//  MiniC02
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 26/09/23.
//

import Foundation

struct EventModel: Identifiable, Codable {
	var id: String?
	var title: String
	var desc: String
	var date: String
	var time: String
	var location: String
	var neighborhood: String
	var hostname: String
	var imagename: String
}



