//
//  Profile+CoreDataProperties.swift
//  MiniC02
//
//  Created by Paulo Sonzzini Ribeiro de Souza on 06/10/23.
//
//

import Foundation
import CoreData


extension Profile {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Profile> {
        return NSFetchRequest<Profile>(entityName: "Profile")
    }

    @NSManaged public var imagename: String?
    @NSManaged public var name: String?
    @NSManaged public var profileid: UUID?
    @NSManaged public var username: String?
    @NSManaged public var profileToTag: Set<Tag>?
	
	public var tags: [Tag] {
		let setOfTags = profileToTag
		return setOfTags!.sorted {
			$0.name ?? "error" < $1.name ?? "error"
		}
	}

}

// MARK: Generated accessors for profileToTag
extension Profile {

    @objc(addProfileToTagObject:)
    @NSManaged public func addToProfileToTag(_ value: Tag)

    @objc(removeProfileToTagObject:)
    @NSManaged public func removeFromProfileToTag(_ value: Tag)

    @objc(addProfileToTag:)
    @NSManaged public func addToProfileToTag(_ values: NSSet)

    @objc(removeProfileToTag:)
    @NSManaged public func removeFromProfileToTag(_ values: NSSet)

}

extension Profile : Identifiable {

}
