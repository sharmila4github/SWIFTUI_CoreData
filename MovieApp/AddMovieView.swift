//
//  AddMovieView.swift
//  MovieApp
//
//  Created by Raghav Deo on 28/12/23.
//
//Any view can dismiss itself, regardless of how it was presented, using @Environment(\.dismiss), and calling that property as a function will cause the view to be dismissed.
import SwiftUI
struct EditMovieConfig
{
    var title:String=""
    init(movie:Movie?=nil)
    {
        guard let movie = movie else
        {
            return
        }
        self.title = movie.title ?? ""
    }
}
struct AddUpdateMovieView: View {
    var movie:Movie?
    @State private var editMovieConfig=EditMovieConfig()
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.dismiss) private var dismis
    private func saveOrUpdateMovie()
    {
       let movie = movie ?? Movie(context: viewContext)
        movie.title = editMovieConfig.title
        do
        {
           try movie.save()
        }
        catch
        {
            print(error.localizedDescription)
        }
    }
    var body: some View {
       Form
        {
            TextField("Title", text: $editMovieConfig.title)
            Button("Save")
            {
               saveOrUpdateMovie()
                dismis()
            }
        }.onAppear {
            if let movie
            {
                editMovieConfig = EditMovieConfig(movie: movie)
            }
        }
    }
}

struct AddMovieView_Previews: PreviewProvider {
    static var previews: some View {
        AddUpdateMovieView()
    }
}
