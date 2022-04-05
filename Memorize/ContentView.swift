//
//  ContentView.swift
//  Memorize
//
//  Created by Victor Khov on 28/3/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var emojis = ["🚚", "✈️", "🏎", "⛵️", "🚂", "🚜", "🛺", "🚀", "🚙", "🚕", "🛵", "🚢", "🚁", "🏍", "🚲"]
    @State var emojiCount = 3
    
    var body: some View {
        VStack {
            Text("Memorize").font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                    ForEach(emojis[0...emojis.count - 1], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            
            HStack {
                vehicles
                Spacer()
                bugs
                
            }.font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
        
    
    var vehicles: some View {
        
        Button(action: {
            
            let vehicles = ["🚚", "✈️", "🏎", "⛵️", "🚂", "🚜", "🛺", "🚀", "🚙", "🚕", "🛵", "🚢", "🚁", "🏍", "🚲"]
            emojis = vehicles.shuffled()
            
        }, label: {
            VStack {
                Image(systemName: "car.fill")
                Text("Vehicles").font(.body)
            }
        })
        
    }
    
    var bugs: some View {
        
        Button(action: {
            
            let bugs = ["🦟", "🐞", "🪲", "🐛", "🐜", "🕷", "🪳", "🪱", "🦗", "🪰", "🐌"]
            emojis = bugs.shuffled()
            
            
        }, label: {
            VStack {
                Image(systemName: "ladybug.fill")
                Text("Bugs").font(.body)
            }
        })
        
    }
    
    
}

struct CardView: View {
    var content : String
    @State var isFacedUp : Bool = true
    
    var body: some View {
        ZStack {
            let card = RoundedRectangle(cornerRadius: 20)
            if isFacedUp {
                card.fill()
                    .foregroundColor(.white)
                card.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
                
            } else {
                
                card.fill()
                    .foregroundColor(.red)
            }
        }
        .onTapGesture {
            isFacedUp = !isFacedUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
