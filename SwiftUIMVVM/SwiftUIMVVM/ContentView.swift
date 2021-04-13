//
//  ContentView.swift
//  SwiftUIMVVM
//
//  Created by monkey on 2021/4/13.
//

import SwiftUI

struct ToDoListItem: Identifiable {
    var id = UUID()
    var action: String
}

class ToDoList: ObservableObject {
    
    @Published var items: [ToDoListItem] = [
        ToDoListItem(action: "Get Milk")
    ]
}

struct ContentView: View {
    
    @ObservedObject var viewModel: ToDoList = ToDoList()
    
    var body: some View {
        
        NavigationView {
            VStack {
                List(viewModel.items) { item in
                    Text(item.action)
                }
            }
            .navigationTitle("To Do List")
            .navigationBarItems(trailing: Button(action: {
                viewModel.items = [
                    ToDoListItem(action: "Go Running"),
                    ToDoListItem(action: "Get Milk"),
                    ToDoListItem(action: "Do Work"),
                    ToDoListItem(action: "Upload video"),
                    ToDoListItem(action: "Teach SwiftUI")
                ]
            }, label: {
                Text("Refresh")
            }))
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .onAppear() {
            print("appear")
            viewModel.items = [
                ToDoListItem(action: "Go Running")
            ]
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
