//
//  Joke+CoreDataProperties.swift
//  DadJokes
//
//  Created by monkey on 2021/5/28.
//
//

import Foundation
import CoreData

extension Joke {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Joke> {
        return NSFetchRequest<Joke>(entityName: "Joke")
    }

    @NSManaged public var setup: String
    @NSManaged public var punchline: String
    @NSManaged public var rating: String

}

extension Joke : Identifiable {

}
