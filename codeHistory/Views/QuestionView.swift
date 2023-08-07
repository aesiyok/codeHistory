//
//  QuestionView.swift
//  Code History
//
//  Created by Adam Esiyok on 8/4/23.
//

import SwiftUI

struct QuestionView: View {
    
    @EnvironmentObject var viewModel: GameViewModel
    let question: Question
    
    var body: some View {
        VStack {
            Text(question.questionText)
                .font(.largeTitle)
                .bold()
                .multilineTextAlignment(.leading)
            Spacer()
            HStack {
                ForEach(0..<question.possibleAnswers.count, id:\.self) { index in
                    Button(action: {
                        print("Tapped on option with the text: \(question.possibleAnswers[index])")
                        viewModel.makeGuess(atIndex: index)
                    }) {
                        ChoiceTextView(choiceText: question.possibleAnswers[index])
                            .background(viewModel.color(forOptionIndex: index))
                    }
                    .disabled(viewModel.guessWasMade)
                }
            }
            if viewModel.guessWasMade {
                Button(action: { viewModel.displayNextScreen() }) {
                    BottomTextView(str: "Next")
                }
            }
        }
    }
}
    
    struct QuestionView_Previews: PreviewProvider {
        static var previews: some View {
            QuestionView(question: Game().currentQuestion)
                .environmentObject(GameViewModel())
        }
    }
