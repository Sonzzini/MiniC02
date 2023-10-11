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
	var acctag: AccessibilityTag
    
    enum CodingKeys: CodingKey {
        case id
        case title
        case desc
        case date
        case time
        case location
        case neighborhood
        case hostname
        case imagename
        case acctag
    }
    
    init(id: String? = nil, title: String, desc: String, date: String, time: String, location: String, neighborhood: String, hostname: String, imagename: String, acctag: AccessibilityTag) {
        self.id = id
        self.title = title
        self.desc = desc
        self.date = date
        self.time = time
        self.location = location
        self.neighborhood = neighborhood
        self.hostname = hostname
        self.imagename = imagename
        self.acctag = acctag
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try values.decode(String.self, forKey: .id)
        self.title = try values.decode(String.self, forKey: .title)
        self.desc = try values.decode(String.self, forKey: .desc)
        self.date = try values.decode(String.self, forKey: .date)
        self.time = try values.decode(String.self, forKey: .time)
        self.location  = try values.decode(String.self, forKey: .location)
        self.neighborhood = try values.decode(String.self, forKey: .neighborhood)
        self.hostname = try values.decode(String.self, forKey: .hostname)
        self.imagename = try values.decode(String.self, forKey: .imagename)
        let tagStr = try values.decode(String.self, forKey: .acctag)
         // TODO: Definir o padrão caso vier nulo da API
        self.acctag = AccessibilityTag(rawValue: tagStr) ?? .ClosedCaptions
   }
    
}



