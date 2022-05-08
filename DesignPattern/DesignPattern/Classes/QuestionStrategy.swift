//
//  QuestionStratergy.swift
//  DesignPattern
//
//  Created by Gawade, Amar on 5/7/22.
//

import Foundation
// MARK: - Strategy for question
protocol QuestionStrategy: AnyObject {
    var title: String { get }
    var correctCount: Int { get }
    var incorrectCount: Int { get }
    
    func advanceToNextQuestion() -> Bool
    func currentQuestion() -> Question
    func markQuestionCorrect(question: Question)
    func markQuestionIncorrect(question: Question)
    func questionIndexTitle() -> String
}
