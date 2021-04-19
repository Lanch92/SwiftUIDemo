//
//  ContentView.swift
//  SwiftUIRedacted
//
//  Created by monkey on 2021/4/16.
//

import SwiftUI

struct ContentView: View {
    
    @State private var loading = true
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ForEach(0...10, id: \.self) { num in
                        PostView()
                            .frame(height: 150)
                            .padding(12)
                    }
                }
                .redacted(reason: loading ? .placeholder : [])
            }
            .navigationTitle("facebook")
        }
        .onAppear() {
            fetchData()
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    func fetchData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            loading = false
        }
    }
}

struct PostView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 55, height: 55)
                    .unredacted()
                Text("Person")
                    .bold()
                    .font(.system(size: 22))
            }
            Text("This is about SwiftUI Redacted. This is about SwiftUI Redacted.")
                .font(.system(size: 24))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
