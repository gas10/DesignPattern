//
//  QuestionModel.swift
//  DesignPattern
//
//  Created by Gawade, Amar on 5/3/22.
//

import Foundation
import Combine

class Question: Codable {
    var question: String
    var answer: String
    var hint: String?
    
    init(_ question: String, _ answer: String, _ hint: String? = nil) {
        self.question = question
        self.answer = answer
        self.hint = hint
    }
}

class QuestionGroup: Codable {
    var name: String
    var questions: [Question]
    private(set) var score: Score
    
    init(_ name: String, _ questions: [Question], _ score: Score) {
        self.name = name
        self.questions = questions
        self.score = score
    }
    
    // Private score
    class Score: Codable {
        // MARK - Variables
        var correctCount = 0 {
            didSet { updateRunningPercentage() }
        }
        
        var incorrectCount = 0 {
            didSet { updateRunningPercentage() }
        }
        
        // Running Percentage
        @Published var runningPercentage: Double = 0
        
        // MARK - Initializers
        init() {
            
        }
        
        func reset() {
            correctCount = 0
            incorrectCount = 0
        }
        
        // MARK: - Calculating Percentage
        private enum CodingKeys: String, CodingKey {
            case correctCount
            case incorrectCount
        }
        
        public required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            // Counts
            self.correctCount = try container.decode(Int.self, forKey: .correctCount)
            self.incorrectCount = try container.decode(Int.self, forKey: .incorrectCount)
            updateRunningPercentage()
        }
        
        // Calculate running percentage
        private func updateRunningPercentage() {
            let totalCount = correctCount + incorrectCount
            runningPercentage = totalCount > 0 ? Double(correctCount) / Double(totalCount) : 0
        }
    }
}

extension QuestionGroup {
    static func getRandomQuestionGroup() -> QuestionGroup {
        return getGeneralKnowledgeGroup()
    }
    
    static func getQuestionGroups() -> [QuestionGroup] {
        return formQuestionsGroup()
    }
    
    private static func getGeneralKnowledgeGroup() -> QuestionGroup {
        var questions = [Question]()
        questions.append(Question("Who is founder of Testla", "Elon Musk", "Start with E"))
        questions.append(Question("How many planets are in solar system", "8", "below 10"))
        questions.append(Question("Who invented general theory of realtivity", "Einstein", "Famous bagels chain"))
        questions.append(Question("Name fastest animal on earth", "Cheeta", "A cat"))
        questions.append(Question("What is your favorite movie", "The Matrix", "Science fiction"))
        
        let group = QuestionGroup("General Knowledge", questions, Score())
        return group
    }
    
    private static func getMathKnowledgeGroup() -> QuestionGroup {
        var questions = [Question]()
        questions.append(Question("2 + 2", "4", "Start with E"))
        questions.append(Question("9 * 9", "8", "below 10"))
        questions.append(Question("10 - 4", "Einstein", "Famous bagels chain"))
        questions.append(Question("15 + 2", "Cheeta", "A cat"))
        questions.append(Question("18 * 8", "The Matrix", "Science fiction"))
        
        let group = QuestionGroup("Math Knowledge", questions, Score())
        return group
    }
    
    private static func getLanguageKnowledgeGroup() -> QuestionGroup {
        var questions = [Question]()
        questions.append(Question("A", "A", "A"))
        questions.append(Question("B", "A", "A"))
        questions.append(Question("C", "A", "A"))
        questions.append(Question("D", "A", "A"))
        questions.append(Question("E", "A", "A"))
        
        let group = QuestionGroup("Language Knowledge", questions, Score())
        return group
    }
    
    private static func formQuestionsGroup() -> [QuestionGroup] {
        var groups = [QuestionGroup]()
        groups.append(getGeneralKnowledgeGroup())
        groups.append(getMathKnowledgeGroup())
        groups.append(getLanguageKnowledgeGroup())
        return groups
    }
}
