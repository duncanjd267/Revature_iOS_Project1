//
//  User+CoreDataProperties.swift
//  Project_1
//
//  Created by admin on 4/29/21.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var password: String?
    @NSManaged public var score: Double
    @NSManaged public var username: String?
    @NSManaged public var q1saved: Bool
    @NSManaged public var q2saved: Bool
    @NSManaged public var q3saved: Bool
    @NSManaged public var q4saved: Bool
    @NSManaged public var q5saved: Bool

}

extension User : Identifiable {

}
