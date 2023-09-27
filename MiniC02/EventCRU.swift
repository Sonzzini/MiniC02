//
//  EventFetcher.swift
//  MiniC02
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 26/09/23.
//

import Foundation

class EventCRU: ObservableObject {
	@Published var events: [EventModel] = []
	
	func getEvents() {
		guard let url = URL(string: "http://10.44.48.23:3000/events") else { fatalError("Missing URL") }
		
		let urlRequest = URLRequest(url: url)
		
		let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
			if let error = error {
				print("Request error: ", error)
				return
			}
			
			guard let response = response as? HTTPURLResponse else { return }
			
			if response.statusCode == 200 {
				guard let data = data else { return }
				DispatchQueue.main.async {
					do {
						let decodedUsers = try JSONDecoder().decode([EventModel].self, from: data)
						self.events = decodedUsers
					} catch let error {
						print("Error decoding: ", error)
					}
				}
			}
		}
		dataTask.resume()
	}
	
	func postEvent(event: EventModel) {
		guard let url = URL(string: "https://10.44.48.23:3000/events") else {
			print("Failed to get URL")
			return
		}
		
		var request = URLRequest(url: url)
		request.setValue("application/json", forHTTPHeaderField: "Content-Type")
		request.httpMethod = "POST"
		
		// implementando na branch feat/postAPI
		guard let encoded = try? JSONEncoder().encode(event) else {
			print("Failed to encode event")
			return
		}
		
		
	}
	
	
}
