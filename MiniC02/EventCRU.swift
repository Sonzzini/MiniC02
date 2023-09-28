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
		guard let url = URL(string: "http://10.44.48.21:3000/events") else { fatalError("Missing URL") }
		
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
	
	/*
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
	 */
	
	func request(_ absoluteURL: String, completion: @escaping (Result<Void, Error>) -> Void) {
		
	}
	
	func postEvent(event: EventModel) {
		guard let url = URL(string: "http://10.44.48.21:3000/events") else { fatalError("Missing URL") }
		
		guard let jsonData = try? JSONEncoder().encode(event) else {
			print("Error trying to convert model to JSON data")
			return
		}
		
		var request = URLRequest(url: url)
		request.httpMethod = "POST"
		request.setValue("application/json", forHTTPHeaderField: "Content-Type")
		request.setValue("application/json", forHTTPHeaderField: "Accept")
		request.httpBody = jsonData
		URLSession.shared.dataTask(with: request) { data, response, error in
			guard error == nil else {
				print("Error calling POST")
				print(error!)
				return
			}
			guard let data = data else {
				print("Error: Did not receive data")
				return
			}
			guard let response = response as? HTTPURLResponse, (200..<299) ~= response.statusCode else {
				print("Error: HTTP request failed")
				return
			}
			do {
				guard let jsonObject = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
					print("Error: Cannot convert data to JSON object")
					return
				}
				guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
					print("Error: Cannot convert JSOn object to Pretty JSON data")
					return
				}
				guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
					print("Error: Couldn't printJSON in String")
					return
				}
				print(prettyPrintedJson)
			} catch {
				print("Error: Trying to convert JSON data to string")
				return
			}
		}.resume()
		
	}
	
	
	
	
	
}

/*
private extension EventCRU {
	enum EventError: Error {
		case invalidURL
		case invalidData
		case failedToDecode
	}
}
*/
