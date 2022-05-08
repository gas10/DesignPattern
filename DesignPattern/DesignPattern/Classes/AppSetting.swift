//
//  AppSetting.swift
//  DesignPattern
//
//  Created by Gawade, Amar on 5/7/22.
//

import Foundation
class AppSetting {
    // Shared instance
    public static let shared = AppSetting()
    
    private init() {
        
    }
    // MARK: - Persisting Strategy to user default
    // Keys
    private struct Keys {
        static let questionStrategy = "QuestionStrategy"
    }
    // User Default
    private let userDefault = UserDefaults.standard
    
    // Current Strategy
    var currentStrategyType: QuestionStrategyType {
        get {
            let rawValue = userDefault.integer(forKey: Keys.questionStrategy)
            return QuestionStrategyType(rawValue: rawValue)!
        }
        set {
            userDefault.set(newValue.rawValue, forKey: Keys.questionStrategy)
        }
    }
    
    // MARK - Get Strategy
    func currentQuestionStrategy(for handler: QuestionGroupHandler) -> QuestionStrategy {
        return currentStrategyType.questionGroupHandler(for: handler)
    }
}
