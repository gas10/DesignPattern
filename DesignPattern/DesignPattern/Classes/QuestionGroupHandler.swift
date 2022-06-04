//
//  QuestionGroupHandler.swift
//  DesignPattern
//
//  Created by Gawade, Amar on 5/7/22.
//

import Foundation
// Load or Persist Question Groups
class QuestionGroupHandler {
    private let fileName = "QuestionGroupData"
    var questionGroups: [QuestionGroup] = []
    var selectedQuestionGroup: QuestionGroup!
    
    init() {
        loadQuestionGroups()
    }
    
    func loadQuestionGroups() {
        if let questionGroups = try? DiskHandler.retrieve([QuestionGroup].self, from: fileName) {
            // Load from saved file on disk
            self.questionGroups = questionGroups
        } else {
            // Load from model
            self.questionGroups = QuestionGroup.getQuestionGroups()
            self.selectedQuestionGroup = self.questionGroups.first
            try! save()
        }
    }
    
    func save() throws {
        try DiskHandler.save(questionGroups, to: fileName)
    }
}
