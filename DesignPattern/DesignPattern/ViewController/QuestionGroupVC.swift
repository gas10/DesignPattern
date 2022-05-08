//
//  MVCPatternMenuVC.swift
//  DesignPattern
//
//  Created by Gawade, Amar on 5/6/22.
//

import Foundation
import UIKit
class QuestionGroupVC: UIViewController {
    // MARK: - Variables
    // View
    var mvcPatternQuestionGroupView: QuestionGroupView!
    
    // MARK: - Initializers
    init() {
        super.init(nibName: nil, bundle: nil)
        title = LocalizationStrings.delegatePatternLabel
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuration
    func configure() {
        self.mvcPatternQuestionGroupView = QuestionGroupView(delegate: self)
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(mvcPatternQuestionGroupView)
    }
    
    func setupConstraints() {
        LayoutHelper.setEqualWidthHeightWithSafeSpace(mvcPatternQuestionGroupView, sourceView: view)
    }
    
    // MARK: - views method
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// Delegates
extension QuestionGroupVC {
    func navigateToQuestionGroup(_ handler: QuestionGroupHandler) {
        let strategy = AppSetting.shared.currentQuestionStrategy(for: handler)
        let vc = QuestionVC(strategy: strategy)
        vc.delegate = self
        navigationController?.modalPresentationStyle = .fullScreen
        fixIssueWithNavigationBarBackground()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // ios 15 +
    func fixIssueWithNavigationBarBackground() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .systemGray
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
    }
}

extension QuestionGroupVC: QuestionVCDelegate {
    func questionViewController(_ vc: QuestionVC, didComplete: QuestionStrategy) {
        navigationController?.popToViewController(self, animated: true)
    }
    
    func questionViewController(_ vc: QuestionVC, didCancel: QuestionStrategy) {
        navigationController?.popToViewController(self, animated: true)
    }
}
