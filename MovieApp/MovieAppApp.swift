//
//  MovieAppApp.swift
//  MovieApp
//
//  Created by Raghav Deo on 28/12/23.
//

import SwiftUI

@main
struct MovieAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, CoreDataProvider.shared.viewContext)
        }
    }
}
/*
 Core Data-ORM
 1.Add core data model
 2.Core data provider:is used to  initialize core data stack
 3.We need to inject viewContext of provider into App file using
 Environment .It is recomded to use @fetchRequest property wrapper in swiftUI coredata.
 4.By some way all entities should get default behaviour so we will create model(Protocol) and we will create extension of model.
    Self:-The only people who can use these model ,they have to be nsmanagedObject
 5.Movie class should confirm Model so we will create Movie+extension
 6.Unlike a traditional full-screen presentation, a sheet appears as a card that overlays the original content, providing a partially transparent view of the underlying screen.we will use sheet control  to add or update Movie.
 
 
 */
