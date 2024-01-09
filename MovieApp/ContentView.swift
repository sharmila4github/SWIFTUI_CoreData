//
//  ContentView.swift
//  MovieApp
//
//  Created by Raghav Deo on 28/12/23.
//

import SwiftUI

struct ContentView: View {
    @FetchRequest(fetchRequest: Movie.all)
    private var movieResults:FetchedResults<Movie>
    @State private var isPresented = false
    private func deleteMovie(indexSet: IndexSet) {
        
        guard let index = indexSet.map({ $0 }).first else {
            return
        }
        
        let movie = movieResults[index]
        do {
            try movie.delete()
        } catch {
            print(error)
        }
    }
    var body: some View {
        NavigationStack
        {
            List {
                ForEach(movieResults) { movie in
                    NavigationLink(movie.title ?? "", value: movie)
                }.onDelete(perform: deleteMovie)
            }
            .navigationDestination(for: Movie.self) { movie in
                AddUpdateMovieView(movie: movie)
                
            }.navigationTitle("Movie")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Add New")
                        {
                            isPresented = true
                        }
                    }
                }.sheet(isPresented: $isPresented) {
                    AddUpdateMovieView()
                }
            
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView().environment(\.managedObjectContext, CoreDataProvider.shared.viewContext)
        }
    }
}
