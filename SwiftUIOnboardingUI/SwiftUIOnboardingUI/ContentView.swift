//
//  ContentView.swift
//  SwiftUIOnboardingUI
//
//  Created by monkey on 2021/5/7.
//

import Combine
import SwiftUI

class Order: ObservableObject, Codable {
    
    // 存在不能(不需要) codable 的属性时
    var objectWillChange = PassthroughSubject<Void, Never>()
    // 需要指定参与 codable 的 keys
    enum CodingKeys: String, CodingKey {
        case type, quantity, name
    }
    
    static let types = ["Vanilla", "Chocolate", "Strawberry"]
    
    var type = 0 { didSet {print(type)} }
    var quantity = 3 { didSet {print(quantity)} }
    
    var name = "" { didSet {print(name)} }
    
    
    var isValid: Bool {
        !name.isEmpty
    }
    
    func update() {
        
    }
}

struct ContentView: View {
    
    @AppStorage("shouldShowOnboarding") var shouldShowOnboarding = true
    
    var body: some View {
        NavigationView {
            VStack {
                Text("You are in the main app now!")
                    .padding()
            }
            .navigationTitle("Home")
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .fullScreenCover(isPresented: $shouldShowOnboarding) {
            OnboardingView(shouldShowOnboarding: $shouldShowOnboarding)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
