//
//  Post+CoreDataProperties.swift
//  CoreData-Number-Facts
//
//  Created by Edward O'Neill on 4/9/20.
//  Copyright © 2020 Edward O'Neill. All rights reserved.
//
//

import Foundation
import CoreData


extension Post {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Post> {
        return NSFetchRequest<Post>(entityName: "Post")
    }

    @NSManaged public var number: Double
    @NSManaged public var title: String?
    @NSManaged public var location: String?
    @NSManaged public var user: User?

}
