//
//  ContentView.swift
//  SwiftUIBottomCard
//
//  Created by monkey on 2021/4/17.
//

import SwiftUI

struct ContentView: View {
    
    @State private var cardShown = false
    @State private var cardDismissal = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Button(action: {
                    cardShown.toggle()
                    cardDismissal.toggle()
                }, label: {
                    Text("Show Card")
                        .bold()
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .background(Color.blue)
                })
                
                BottomCard(
                    cardShown: $cardShown,
                    cardDismissal: $cardDismissal,
                    height: UIScreen.main.bounds.height / 2.2) {
                    CardContent()
                        .padding()
                }
            }
            .navigationTitle("Bottom Card")
        }
    }
}

struct CardContent: View {
    var body: some View {
        Text("Photo Collage")
            .bold()
            .font(.system(size: 30))
        
        Text("You can create awesome photo grids and share them with all of your friends.")
            .font(.system(size: 18))
            .multilineTextAlignment(.center)
        
        Image("Image")
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

struct BottomCard<Content: View>: View {
    
    let content: Content
    @Binding var cardShown: Bool
    @Binding var cardDismissal: Bool
    let height: CGFloat
    
    
    init(cardShown: Binding<Bool>,
         cardDismissal: Binding<Bool>,
         height: CGFloat = 300,
         @ViewBuilder content: () -> Content
         ) {
        _cardShown = cardShown
        _cardDismissal = cardDismissal
        self.height = height
        self.content = content()
    }
    
    var body: some View {
        
        ZStack {
            // Dimmed
            GeometryReader { _ in
                EmptyView()
            }
            .background(Color.gray.opacity(0.5))
            .opacity(cardShown ? 1.0 : 0)
            .animation(.easeIn)
            .onTapGesture {
                dismiss()
            }
            
            // Card
            VStack {
                Spacer()
                
                VStack {
                    content
                    
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("Dismiss")
                            .frame(width: UIScreen.main.bounds.width / 2, height: 50)
                            .background(Color.pink)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    })
                    .padding()
                }
                .background(Color.white)
                .frame(height: height)
                .offset(y: cardShown && cardDismissal ? 0 : height)
                .animation(Animation.default.delay(0.2))
            }
            .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/, antialiased: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
        }
        .ignoresSafeArea()
    }
    
    func dismiss() {
        cardDismissal.toggle()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
            cardShown.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
