//
//  CoreDataManager.swift
//  CoreData-Number-Facts
//
//  Created by Edward O'Neill on 4/9/20.
//  Copyright © 2020 Edward O'Neill. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager {
    // impliment singleton
    static let shared = CoreDataManager()
    private init() {}
    
    private var users = [User]() // User is a NSManagedObject
    private var posts = [Post]()
    
    // access the to persistence container refernce from the app delegate
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    // viewContext is of type NSManagedObjectContext
    
    // C(reate)R(ead)U(ptate)D(elete)
    public func createUser(name: String, dob: Date) -> User {
        let user = User(entity: User.entity(), insertInto: context)
        user.name = name
        user.dob = dob
        
        //===========================================
        // save changes to the NSManagedObjectContext
        //===========================================
        // persistence = savign data
        // persistence we're done so far: user default, documents directory, firebase, core data, (iCloud)
        // similar to saving to documents directory
        
        do {
            try context.save() // NSManagedObjectContext
        } catch {
            print("error creating user: \(error)")
        }
        return user
    }
    
    public func fetchUser() -> [User] {
        do {
            users = try context.fetch(User.fetchRequest()) // fetchRequest() gets all the objects from core data
            // Extra note: we can use NSPredicate to sort and filter Core Data objects during fetching
        } catch {
            print("error fetching users: \(error)")
        }
        return users
    }
}
