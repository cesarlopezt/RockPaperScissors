//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Cesar Lopez on 3/8/23.
//

import SwiftUI

var optionToWin = [
    "🪨": "📄",
    "📄": "✂️",
    "✂️": "🪨"
]

struct IconOptionButton: View {
    var content: String
    var action: () -> Void
    
    var body: some View {
        Button(content, action: action)
            .font(.largeTitle)
            .padding(15)
            .background(Color.secondary.opacity(0.2))
            .clipShape(
                RoundedRectangle(cornerRadius: 10)
            ).overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.secondary, style: StrokeStyle(lineWidth: 5, dash: [10]))
            )
    }
}

struct ContentView: View {
    @State private var letTheApp = "win"
    @State private var appChoice = "📄"
    
    var choices = ["🪨", "📄", "✂️"]

    var body: some View {
        VStack {
            Text("Rock, Paper, Scissors")
            Spacer()
            VStack {
                HStack {
                    Text("Q1").font(.title3)
                    Spacer()
                    Text("Score: 10")
                        .font(.title3)
                }
                VStack(spacing: 10) {
                    Text("I choose:")
                        .font(.title2)
                        .bold()
                    Text("🪨")
                        .font(.largeTitle)
                    Text(letTheApp == "win" ? "Let me win" : "I want to loose")
                        .font(.title)
                        .foregroundColor(letTheApp == "win" ? .green : .red)
                        .bold()
                }
                .frame(maxWidth: .infinity)
                .padding(30)
                .background(Color.secondary.opacity(0.2))
                .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding(30)
        
            
            Spacer()

            HStack(spacing: 20) {
                ForEach(choices, id: \.self) { choice in
                    IconOptionButton(content: choice) {
//                        evaluateAnswer(with: choice)
                    }
                }
            }
        }
        .padding()

    }
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
