//
//  BaseQuestionStrategy.swift
//  DesignPattern
//
//  Created by Gawade, Amar on 5/7/22.
//

import Foundation

class BaseQuestionStrategy: QuestionStrategy {
    // MARK: - Variables
    var correctCount: Int {
        get { return questionGroup.score.correctCount }
        set { questionGroup.score.correctCount = newValue }
    }
    
    var incorrectCount: Int {
        get { return questionGroup.score.incorrectCount }
        set { questionGroup.score.incorrectCount = newValue }
    }
    
    private var questionIndex = -1
    private var questionGroupHandler: QuestionGroupHandler
    private var questionGroup: QuestionGroup {
        get { return questionGroupHandler.selectedQuestionGroup }
        set { questionGroupHandler.selectedQuestionGroup = newValue }
    }
    
    var title: String {
        questionGroup.name
    }
    
    // MARK: - Initializers
    public init(questionGroupHandler: QuestionGroupHandler, questionGroup: QuestionGroup) {
        self.questionGroupHandler = questionGroupHandler
        self.questionGroup = questionGroup
        self.questionGroupHandler.selectedQuestionGroup.score = Score()
    }
    
    // MARK: - Methods
    func advanceToNextQuestion() -> Bool {
        guard questionIndex + 1 < questionGroup.questions.count else {
            return false
        }
        questionIndex += 1
        return true
    }
    
    func currentQuestion() -> Question {
        return questionGroup.questions[questionIndex]
    }
    
    func markQuestionCorrect(question: Question) {
        correctCount += 1
    }
    
    func markQuestionIncorrect(question: Question) {
        incorrectCount += 1
    }
    
    func questionIndexTitle() -> String {
        return "\(questionIndex + 1)/\(questionGroup.questions.count)"
    }
}


class SequentialStrategy: BaseQuestionStrategy {
    convenience init(questionGroupHandler: QuestionGroupHandler) {
        let group = questionGroupHandler.selectedQuestionGroup
        self.init(questionGroupHandler: questionGroupHandler, questionGroup: group!)
    }
}

class RandomQuestionStrategy: BaseQuestionStrategy {
    convenience init(questionGroupHandler: QuestionGroupHandler) {
        let group = questionGroupHandler.selectedQuestionGroup
        group!.questions = group!.questions.shuffled()
        self.init(questionGroupHandler: questionGroupHandler, questionGroup: group!)
    }
}
