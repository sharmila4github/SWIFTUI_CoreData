//
//  Provider.swift
//  MovieApp
//
//  Created by Raghav Deo on 28/12/23.
//

import Foundation
import CoreData
class CoreDataProvider
{
    static let shared = CoreDataProvider()
    
    private let persistentContainer: NSPersistentContainer
    
    var viewContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }
  
    private init(){
        persistentContainer = NSPersistentContainer(name: "MovieModel")
        persistentContainer.loadPersistentStores { _, error in
            if let error {
                fatalError("Unable to load store with error: \(error)")
            }
        }
    }
    
}
