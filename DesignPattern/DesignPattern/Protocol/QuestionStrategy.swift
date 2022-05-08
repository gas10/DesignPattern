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

// MARK: Question Strategy Type
enum QuestionStrategyType: Int, CaseIterable {
    case sequential
    case random
    
    var title: String {
        switch self {
        case .sequential:
            return LocalizationStrings.sequential
        case .random:
            return LocalizationStrings.random
        }
    }
    
    public func questionGroupHandler(for handler: QuestionGroupHandler) -> QuestionStrategy {
        switch self {
        case .sequential:
            return SequentialStrategy(questionGroupHandler: handler)
        case .random:
            return RandomQuestionStrategy(questionGroupHandler: handler)
        }
    }
}

// MARK: - Sequential
class OldSequentialStrategy: QuestionStrategy {
    // MARK: - Variables
    var correctCount: Int {
        get { return questionGroup.score.correctCount }
        set { questionGroup.score.correctCount = newValue }
    }
    var incorrectCount: Int {
        get { return questionGroup.score.incorrectCount }
        set { questionGroup.score.incorrectCount = newValue }
    }
    var questionGroup: QuestionGroup
    var index = -1
    
    var title: String {
        return questionGroup.name
    }
    
    // MARK: - Initializers
    init(questionGroup: QuestionGroup) {
        self.questionGroup = questionGroup
    }
    
    // MARK: - Methods
    func advanceToNextQuestion() -> Bool {
        guard index + 1 < questionGroup.questions.count else { return false }
        index += 1
        return true
    }
    
    func currentQuestion() -> Question {
        return questionGroup.questions[index]
    }
    
    func markQuestionCorrect(question: Question) {
        correctCount += 1
    }
    
    func markQuestionIncorrect(question: Question) {
        incorrectCount += 1
    }
    
    func questionIndexTitle() -> String {
        return "\(index + 1) / \(questionGroup.questions.count)"
    }
}

 // MARK: - Random
class OldRandomQuestionStrategy: QuestionStrategy {
    // MARK: - Variables
    public var correctCount: Int = 0
    public var incorrectCount: Int = 0
    private var questionIndex = -1
    private let questionGroup: QuestionGroup
    
    public var title: String {
        return questionGroup.name
    }
    
    // MARK: - Initializers
    public init(questionGroup: QuestionGroup) {
        self.questionGroup = questionGroup
        questionGroup.questions = questionGroup.questions.shuffled()
    }
    
    // MARK: - Methods
    public func advanceToNextQuestion() -> Bool {
        guard questionIndex + 1 < questionGroup.questions.count else {
            return false
        }
        questionIndex += 1
        return true
    }
    
    public func currentQuestion() -> Question {
        return questionGroup.questions[questionIndex]
    }
    
    public func markQuestionCorrect(question: Question) {
        correctCount += 1
    }
    
    public func markQuestionIncorrect(question: Question) {
        incorrectCount += 1
    }
    
    public func questionIndexTitle() -> String {
        return "\(questionIndex + 1)/\(questionGroup.questions.count)"
    }
}
