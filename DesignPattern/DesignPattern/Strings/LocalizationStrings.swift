//
//  LocalizationStrings.swift
//  DesignPattern
//
//  Created by Gawade, Amar on 5/3/22.
//

import Foundation
class LocalizationStrings {
    static var patternLabelMap: [String: Pattern] = {
        var map = [String: Pattern]()
        map[mvcLabel] = .mvc
        map[mvcQuestionLabel] = .mvcQuestion
        map[delegatePatternLabel] = .delegation
        map[strategyPatternLabel] = .strategy
        map[singletonPatternLabel] = .singleton
        map[mementoPatternLabel] = .memento
        return map
    }()
    
    // Values
    static let mvcLabel = "MVC Pattern"
    static let mvcQuestionLabel = "MVC Pattern - Question"
    static let delegatePatternLabel = "Delegate Pattern - Question Group"
    static let strategyPatternLabel = "Strategy Pattern - Sequential and Random"
    static let singletonPatternLabel = "Singleton Pattern - Settings"
    static let mementoPatternLabel = "Memento Pattern - Encode/Decode"
    
    
    //
    static let sequential = "Sequential"
    static let random = "Random"
}
