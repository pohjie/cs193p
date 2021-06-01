//
//  ContentView.swift
//  Memorize
//
//  Created by Poh Jie on 27/5/21.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = ["🇬🇧", "🏴󠁧󠁢󠁥󠁮󠁧󠁿", "🇺🇸", "🏳️‍🌈",
                         "🇫🇲", "🇸🇨", "🇩🇰", "🇦🇪"]
    
    @State var emojiCount = 8
    
    var body: some View {
        VStack {
            Text("Memorize")
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                vehicleIcon
                Spacer()
                faceIcon
                Spacer()
                flagIcon
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    var vehicleIcon: some View {
        VStack {
            Button(action: {
                emojis = ["🚀", "🚴‍♀️", "⛴", "🚖",
                          "✈️", "🚗", "🚙", "🚛"].shuffled()
                emojiCount = Int.random(in: 4...8)
            }, label: {
                Image(systemName: "car")
            })
            Text("Vehicles")
                .font(.footnote)
                .foregroundColor(Color.blue)
        }
    }
    
    var faceIcon: some View {
        VStack {
            Button(action: {
                emojis = ["😀", "😃", "😄", "😁",
                          "😅", "😂", "🤣", "🥲"].shuffled()
                emojiCount = Int.random(in: 4...8)
            }, label: {
                Image(systemName: "face.smiling")
            })
            Text("Faces")
                .font(.footnote)
                .foregroundColor(Color.blue)
        }
    }
    
    var flagIcon: some View {
        VStack {
            Button(action: {
                emojis = ["🇬🇧", "🏴󠁧󠁢󠁥󠁮󠁧󠁿", "🇺🇸", "🏳️‍🌈",
                          "🇫🇲", "🇸🇨", "🇩🇰", "🇦🇪"].shuffled()
                emojiCount = Int.random(in: 4...8)
            }, label: {
                Image(systemName: "flag")
            })
            Text("Flags")
                .font(.footnote)
                .foregroundColor(Color.blue)
        }
    }
    
    var add: some View {
        Button(action: {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        }, label: {
            Image(systemName: "plus.circle")
        })
    }
    
    var remove: some View {
        Button(action: {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        }, label: {
            Image(systemName: "minus.circle")
        })
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content)
                    .font(.title)
            }
            else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
