//
//  JokeCard.swift
//  DadJokes
//
//  Created by monkey on 2021/5/28.
//

import SwiftUI
import CoreData

struct JokeCard: View {
    
    @Environment(\.managedObjectContext) var moc
    @State private var showingPunchline = false
    @State private var dragAmount = CGSize.zero
    var joke: Joke
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Spacer()
                
                VStack {
                    Text(joke.setup)
                        .font(.largeTitle)
                        .lineLimit(10)
                        .padding([.horizontal])
                    
                    Text(joke.punchline)
                        .font(.title)
                        .lineLimit(10)
                        .padding([.horizontal, .bottom])
                        .blur(radius: showingPunchline ? 0 : 6)
                        .opacity(showingPunchline ? 1 : 0.25)
                }
                .multilineTextAlignment(.center)
                .clipShape(RoundedRectangle(cornerRadius: 25))
                .background(
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color.white)
                        .shadow(radius: 5)
                )
                .onTapGesture {
                    withAnimation {
                        
                        showingPunchline.toggle()
                    }
                }
                
                EmojiView(for: joke.rating)
                    .font(.system(size: 72))
                
                Spacer()
            }
            .rotation3DEffect(.degrees(-Double(geo.frame(in: .global).minX)) / 10, axis: (x: 0, y: 1, z: 0))
        }
        .frame(minHeight: 0, maxHeight: .infinity)
        .frame(width: 300)
        .offset(y: dragAmount.height)
        .gesture(
            DragGesture()
                .onChanged { dragAmount = $0.translation }
                .onEnded { _ in
                    if dragAmount.height < -200 {
                        // delete this thing
                        withAnimation {
                            dragAmount = CGSize(width: 0, height: -1000)
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                moc.delete(joke)
                                try? moc.save()
                            }
                        }
                    } else {
                        dragAmount = .zero
                    }
                }
        )
        .animation(.spring())
    }
}

struct JokeCard_Previews: PreviewProvider {
    static var previews: some View {
        let joke = Joke(context: NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType))
        joke.setup = "1234"
        joke.punchline = "5678"
        joke.rating = "Smirk"
        
        return JokeCard(joke: joke)
    }
}
