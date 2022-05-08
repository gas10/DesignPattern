//
//  MVCPatternMenuView.swift
//  DesignPattern
//
//  Created by Gawade, Amar on 5/6/22.
//

import UIKit
class QuestionGroupView: UIView {
    // MARK: - Variables
    var questionGroups: [QuestionGroup]!
    var delegate: QuestionGroupVC?
    var questionGroupHandler: QuestionGroupHandler!
    
    var selectedQuestionGroup: QuestionGroup! {
        get { return questionGroupHandler.selectedQuestionGroup }
        set { questionGroupHandler.selectedQuestionGroup = newValue }
    }
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.delegate = self
        table.register(QuestionGroupCell.self, forCellReuseIdentifier: QuestionGroupCell.identifier)
        return table
    }()
    
    // MARK: - Constructor
    init(delegate: QuestionGroupVC? = nil) {
        super.init(frame: .zero)
        self.delegate = delegate
        backgroundColor = ColorConstant.mvcPatternViewBackgroundColor
        questionGroupHandler = QuestionGroupHandler()
        questionGroups = questionGroupHandler.questionGroups
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - View Initialization
    lazy var contentView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Setup function
    func configure() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        self.addSubview(contentView)
        contentView.addSubview(tableView)
    }
    
    func setupConstraints() {
        LayoutHelper.setEqualWidthHeight(contentView, sourceView: self)
        LayoutHelper.setEqualWidthHeight(tableView, sourceView: contentView)
    }
    
    // MARK: - Helper function
    func updateMutableConstraints() {
        
    }
    
    func updateWithModel() {
        
    }
    
    // MARK: - View Controlls
    
    
    // MARK: - Delegate Controls
//    func updateNavTitle(with name: String) {
//        delegate.updateNavTitle(with: name)
//    }
}

// MARK: - Extensions
extension QuestionGroupView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionGroups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: QuestionGroupCell.identifier) as? QuestionGroupCell
        else {
            fatalError("Unable to create QuestionGroupCell")
        }
        cell.updateWithModel(name: questionGroups[indexPath.row].name, percentage: 0)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedQuestionGroup = questionGroups[indexPath.row]
        delegate?.navigateToQuestionGroup(questionGroupHandler)
    }
}

extension QuestionGroupView: UITableViewDataSource {
    
}
