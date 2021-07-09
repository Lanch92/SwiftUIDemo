//
//  ViewWithTask.swift
//  SwiftUI3News
//
//  Created by monkey on 2021/7/8.
//

import SwiftUI

struct SourceViewer: View {
    let site: String
    @State private var sourceCode = "Loading..."
    
    var body: some View {
        ScrollView {
            Text(sourceCode)
                .font(.system(.body, design: .monospaced))
        }
        .task {
            guard let url = URL(string: "https://\(site)") else { return }
            
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                sourceCode = String(decoding: data, as: UTF8.self).trimmingCharacters(in: .whitespacesAndNewlines)
            } catch {
                sourceCode = "Failed to fetch site."
                print("Oops!")
            }
        }
    }
}

struct ViewWithTask: View {
    let sites = ["apple.com", "HackingWithSwift.com"]
    var body: some View {
        NavigationView {
            List(sites, id: \.self) {site in
                NavigationLink(destination: SourceViewer(site: site)) {
                    Text(site)
                }
            }
            .navigationTitle("View Source")
        }
        .navigationViewStyle(.stack)
    }
}

struct ViewWithTask_Previews: PreviewProvider {
    static var previews: some View {
        ViewWithTask()
    }
}
