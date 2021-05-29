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
        ZStack(alignment: .top) {
            LinearGradient(gradient: Gradient(colors: [Color("Start"), Color("Middle"), Color("End")]), startPoint: .top, endPoint: .bottom)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    
                    ForEach(jokes, id: \.setup) { joke in
                        JokeCard(joke: joke)
                    }
                }
            }
            
            Button("Add Joke") {
                showingAddJoke.toggle()
            }
            .padding()
            .background(Color.black.opacity(0.5))
            .clipShape(Capsule())
            .foregroundColor(.white)
            .offset(y: 50)
        }
        .ignoresSafeArea()
        .sheet(isPresented: $showingAddJoke) {
            
                NavigationView {
                    AddView()
                        .navigationTitle("New Joke")
                        .environment(\.managedObjectContext, moc)
                }
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
