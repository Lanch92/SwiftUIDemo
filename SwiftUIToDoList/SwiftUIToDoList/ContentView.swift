//
//  ContentView.swift
//  SwiftUIToDoList
//
//  Created by monkey on 2021/4/13.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var context
    
    @FetchRequest(fetchRequest: ToDoListItem.getAllToDoListItem()) var items: FetchedResults<ToDoListItem>
    
    @State private var text: String = ""
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("New Item")) {
                    HStack {
                        TextField("Enter new item", text: $text)
                        
                        Button(action: {
                            
                            if !text.isEmpty {
                                
                                let newItem = ToDoListItem(context: context)
                                newItem.name = text
                                newItem.createdAt = Date()
                                text = ""
                                
                                do {
                                    try context.save()
                                } catch {
                                    print("save to do list item error \(error)!")
                                }
                            }
                            
                        }, label: {
                            Text("Save")
                        })
                    }
                }
                
                Section {
                    ForEach(items) { todoItem in
                        
                        VStack(alignment: .leading) {
                            Text("\(todoItem.name!)")
                                .font(.headline)
                            Text("\(todoItem.createdAt!)")
                        }
                    }
                    .onDelete(perform: { indexSet in
                        guard let index = indexSet.first else {
                            return
                        }
                        
                        let itemToDelete = items[index]
                        context.delete(itemToDelete)
                        
                        do {
                            try context.save()
                        }
                        catch {
                            print(error.localizedDescription)
                        }
                        
                    })
                }
            }
            .navigationTitle("To Do List")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
