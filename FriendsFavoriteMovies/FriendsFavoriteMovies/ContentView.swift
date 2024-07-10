//
//  ContentView.swift
//  FriendsFavoriteMovies
//
//  Created by Jonathan McDaniel on 7/9/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query (sort: \Movie.title) private var movies: [Movie]
    
    @State private var newMovie: Movie?

    var body: some View {
        NavigationSplitView {
            Group {
                if !movies.isEmpty {
                    List {
                        ForEach(movies) { movie in
                            NavigationLink {
                                MovieDetail(movie: movie)
                            } label: {
                                Text(movie.title)
                            }
                        }
                        .onDelete(perform: deleteMovies)
                    }
                }
                else {
                    ContentUnavailableView {
                        Label("No Movies", systemImage: "film.stack")
                    }
                }
            }
            .navigationTitle("Movies")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addMovie) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            .sheet(item: $newMovie) { movie in
                NavigationStack {
                    MovieDetail(movie: movie, isNew: true)
                }
            }
            .interactiveDismissDisabled()
            
        } detail: {
            Text("Select a movie")
                .navigationTitle("Movie")
        }
    }

    private func addMovie() {
        withAnimation {
            let newItem = Movie(title: "", releaseDate: .now)
            newMovie = newItem
        }
    }

    private func deleteMovies(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(movies[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(SampleData.shared.modelContainer)
}


#Preview ("Empty") {
    ContentView()
        .modelContainer(for: Movie.self, inMemory: true)
}