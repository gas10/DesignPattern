//
//  MVCPatternVC.swift
//  DesignPattern
//
//  Created by Gawade, Amar on 5/3/22.
//

import Foundation
import UIKit
class QuestionView: UIView {
    // MARK: - Variables
    var delegate: QuestionDelegate?
    var question: Question?
    
    lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: FontConstant.titleFont)
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var hintLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: FontConstant.labelFont)
        label.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showHintTapped))
        label.addGestureRecognizer(tapGesture)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var answerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: FontConstant.labelFont)
        label.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showAnswerTapped))
        label.addGestureRecognizer(tapGesture)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var correctLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isUserInteractionEnabled = true
        label.font = UIFont.boldSystemFont(ofSize: FontConstant.labelFont)
        label.backgroundColor = .green
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(correctTapped))
        label.addGestureRecognizer(tapGesture)

        return label
    }()
    
    lazy var incorrectLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: FontConstant.labelFont)
        label.backgroundColor = .red
        label.isUserInteractionEnabled = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(incorrectTapped))
        label.addGestureRecognizer(tapGesture)
        return label
    }()
    
    lazy var detailsStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [correctLabel, incorrectLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = SizeConstant.questionViewHStackSpacing
        stack.axis = .horizontal
        stack.alignment = .fill
        return stack
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [questionLabel, hintLabel, answerLabel, detailsStackView])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = SizeConstant.questionViewVStackSpacing
        stack.axis = .vertical
        stack.alignment = .center
        return stack
    }()
    
    // MARK: - Initializers
    init() {
        super.init(frame: .zero)
        self.backgroundColor = ColorConstant.mvcPatternQuestionViewBackgroundColor
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Configuration
    func configure() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        self.addSubview(stackView)
    }
    
    func setupConstraints() {
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8).isActive = true
        stackView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8).isActive = true
    }
    
    func updateWithModel(_ question: Question, _ correctCount: Int, _ wrontCount: Int) {
        self.question = question
        questionLabel.text = question.question
        hintLabel.text = "Show Hint"
        hintLabel.isUserInteractionEnabled = true
        answerLabel.text = "Show Answer"
        answerLabel.isUserInteractionEnabled = true
        correctLabel.text = "Correct: \(correctCount)"
        incorrectLabel.text = "Wrong: \(wrontCount)"
    }
    
    @objc func showHintTapped() {
        hintLabel.text = question?.hint
        hintLabel.isUserInteractionEnabled = false
    }
    
    @objc func showAnswerTapped() {
        answerLabel.text = question?.answer
        answerLabel.isUserInteractionEnabled = false
    }
    
    @objc func correctTapped() {
        delegate?.updateCorrectCount()
    }
    
    @objc func incorrectTapped() {
        delegate?.updateWrongCount()
    }
}
