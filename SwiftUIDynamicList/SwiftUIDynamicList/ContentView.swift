//
//  ContentView.swift
//  SwiftUIDynamicList
//
//  Created by monkey on 2021/4/16.
//

import SwiftUI

struct Stock: Identifiable {
    var id = UUID()
    let title: String
}

class StockViewModel: ObservableObject {
    
    @Published var stocks: [Stock] = [
        Stock(title: "Apple"),
        Stock(title: "Google"),
        Stock(title: "Amazon"),
        Stock(title: "MSFT")
    ]
}

struct ContentView: View {
    
    @ObservedObject var stockViewModel = StockViewModel()
    @State private var text = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Section(header: Text("Add New Stock")) {
                    TextField("Company Name...", text: $text)
                        .padding()
                    
                    Button(action: {
                        tryToAddToList()
                    }, label: {
                        Text("Add to list")
                            .bold()
                            .frame(width: 250, height: 50)
                            .background(Color(.green))
                            .cornerRadius(8)
                            .foregroundColor(.white)
                    })
                }
                
                List {
                    ForEach(stockViewModel.stocks) { stock in
                        StockView(title: stock.title)
                    }
                    .onDelete(perform: { indexSet in
                        guard let index = indexSet.first else { return }
                        stockViewModel.stocks.remove(at: index)
                    })
                }
            }
            .navigationTitle("Stocks")
        }
    }
    
    func tryToAddToList() {
        guard !text.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        stockViewModel.stocks.append(Stock(title: text))
        text = ""
    }
}

struct StockView: View {
    
    let title: String
    
    var body: some View {
        Label(
            title: { Text(title) },
            icon: { Image(systemName: "chart.bar") }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
