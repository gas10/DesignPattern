//
//  QuestionStrategyType.swift
//  DesignPattern
//
//  Created by Gawade, Amar on 5/7/22.
//

import Foundation
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
    
    public func questionStrategy(for handler: QuestionGroupHandler) -> QuestionStrategy {
        switch self {
        case .sequential:
            return SequentialStrategy(questionGroupHandler: handler)
        case .random:
            return RandomQuestionStrategy(questionGroupHandler: handler)
        }
    }
}
