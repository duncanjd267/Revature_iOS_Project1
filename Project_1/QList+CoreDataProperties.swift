//
//  QList+CoreDataProperties.swift
//  Project_1
//
//  Created by admin on 4/30/21.
//
//

import Foundation
import CoreData


extension QList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<QList> {
        return NSFetchRequest<QList>(entityName: "QList")
    }

    @NSManaged public var qid: String?
    @NSManaged public var question1: Double
    @NSManaged public var question2: Double
    @NSManaged public var question3: Double
    @NSManaged public var question4: Double
    @NSManaged public var question5: Double
    @NSManaged public var user: String?
    @NSManaged public var submitted: Bool

}

extension QList : Identifiable {

}
