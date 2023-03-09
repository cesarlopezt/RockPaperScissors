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
            .background(.secondary.opacity(0.2))
            .clipShape(
                RoundedRectangle(cornerRadius: 10)
            ).overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.secondary, style: StrokeStyle(lineWidth: 5, dash: [10]))
            )
    }
}

struct ContentView: View {
    @State private var letTheAppWin = true
    @State private var appChoice = "📄"
    @State private var score = 0
    @State private var questionNum = 1
    @State private var showingAlert = false
    
    let choices = ["🪨", "📄", "✂️"]

    var body: some View {
        VStack {
            Text("Rock, Paper, Scissors").font(.title2)
            Spacer()
            VStack {
                HStack {
                    Text("Q\(questionNum)")
                        .font(.title3)
                    Spacer()
                    Text("Score: \(score)")
                        .font(.title3)
                }
                VStack(spacing: 10) {
                    Text("I choose:")
                        .font(.title2)
                        .bold()
                    Text(appChoice)
                        .font(.system(size: 100))
                    Text(letTheAppWin ? "Let me win" : "I want to loose")
                        .font(.title)
                        .foregroundColor(letTheAppWin ? .green : .red)
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
                        evaluateAnswer(with: choice)
                    }
                }
            }
        }
        .padding()
        .alert("End", isPresented: $showingAlert) {
            Button("Restart Game") {
                score = 0
                questionNum = 0
                nextQuestion()
            }
        } message: {
            Text("Your score was \(score)")
        }

    }
    
    func evaluateAnswer(with choice: String) {
        let userWon = choice == optionToWin[appChoice]
        
        if choice == appChoice {
            
        } else if letTheAppWin && !userWon {
            score += 1
        } else if !letTheAppWin && userWon {
            score += 1
        } else {
            score -= 1
        }
        nextQuestion()
    }
    
    func nextQuestion() {
        if (questionNum < 10) {
            appChoice = choices.randomElement()!
            letTheAppWin.toggle()
            questionNum += 1
        } else {
            showingAlert = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
