//
//  MVCPatternVC.swift
//  DesignPattern
//
//  Created by Gawade, Amar on 5/3/22.
//

import UIKit

class QuestionVC: UIViewController {
    // MARK: - Variables
    var questionView: QuestionView!
    var questionStrategy: QuestionStrategy!
    
    // Delegate
    public var delegate: QuestionVCDelegate?
    
    
    private lazy var questionIndexItem: UIBarButtonItem = {
        let item = UIBarButtonItem()
        item.tintColor = .black
        navigationItem.rightBarButtonItem = item
        return item
    }()
    
    // MARK: - Initializers
    init(strategy: QuestionStrategy? = nil) {
        super.init(nibName: nil, bundle: nil)
        // Assign Strategy if provided else Assign default as sequential strategy
        if strategy != nil {
            self.questionStrategy = strategy
        } else {
            // Assign selected group for handler
            // selected group will be nil when loaded from disk
            let handler = QuestionGroupHandler()
            handler.selectedQuestionGroup = handler.questionGroups.first
            self.questionStrategy = SequentialStrategy(questionGroupHandler: handler)
        }
        navigationItem.title = questionStrategy.title
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuration
    func configure() {
        setupViewAndDatasource()
        setupViews()
        setupConstraints()
    }
    
    func setupViewAndDatasource() {
        self.questionView = QuestionView()
        self.questionView.delegate = self
    }
    
    func setupViews() {
        view.addSubview(questionView)
    }
    
    func setupConstraints() {
        LayoutHelper.setEqualWidthHeightWithSafeSpace(questionView, sourceView: view)
    }
    
    // MARK: - views method
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCancelButton()
        showNextQuestion()
    }
    
    func setupCancelButton() {
        let config = UIImage.SymbolConfiguration(textStyle: .body)
        let image = UIImage(systemName: "list.dash", withConfiguration: config)
        let barButton = UIBarButtonItem(image: image,
                                       style: .plain,
                                       target: self,
                                       action: #selector(didCancel))
        barButton.tintColor = .black
        navigationItem.leftBarButtonItem = barButton
    }
    
    @objc func didCancel() {
        delegate?.questionViewController(self, didCancel: questionStrategy)
    }
}

extension QuestionVC: QuestionDelegate {
    
    func getNextQuestion() -> Question? {
        guard questionStrategy.advanceToNextQuestion() else {
            delegate?.questionViewController(self, didComplete: questionStrategy)
            return nil
        }
        return questionStrategy.currentQuestion()
    }
    
    func showNextQuestion() {
        guard let nextQuestion = getNextQuestion() else { return }
        questionView.updateWithModel(nextQuestion, questionStrategy.correctCount, questionStrategy.incorrectCount)
        questionIndexItem.title = questionStrategy.questionIndexTitle()
    }
    
    func updateCorrectCount() {
        questionStrategy.markQuestionCorrect(question: questionStrategy.currentQuestion())
        showNextQuestion()
    }
    
    func updateWrongCount() {
        questionStrategy.markQuestionIncorrect(question: questionStrategy.currentQuestion())
        showNextQuestion()
    }
}

protocol QuestionDelegate {
    func showNextQuestion()
    func updateCorrectCount()
    func updateWrongCount()
}

protocol QuestionVCDelegate: AnyObject {
    func questionViewController(_ vc: QuestionVC, didComplete: QuestionStrategy)
    func questionViewController(_ vc: QuestionVC, didCancel: QuestionStrategy)
}
