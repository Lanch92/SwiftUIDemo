//
//  ContentView.swift
//  DadJokes
//
//  Created by monkey on 2021/5/28.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Joke.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Joke.setup, ascending: true)
    ]) var jokes: FetchedResults<Joke>
    @State private var showingAddJoke = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(jokes, id: \.setup) { joke in
                    NavigationLink(destination: Text(joke.punchline)) {
                        EmojiView(for: joke.rating)
                        Text(joke.setup)
                    }
                }
                .onDelete(perform: removeJoke)
                
                Button("Add Joke") {
                    showingAddJoke.toggle()
                }
            }
            .listStyle(SidebarListStyle())
            .sheet(isPresented: $showingAddJoke, content: {
                AddView()
                    .frame(minWidth: 400, maxHeight: .infinity)
                    .padding()
                    .environment(\.managedObjectContext, moc)
            })
        }
    }
    
    func removeJoke(at offsets: IndexSet) {
        guard let index = offsets.first else { return }
        moc.delete(jokes[index])
        try? moc.save()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
