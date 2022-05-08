//
//  QuestionGroupCell.swift
//  DesignPattern
//
//  Created by Gawade, Amar on 5/6/22.
//
import UIKit
class QuestionGroupCell: UITableViewCell {
    // MARK: - Variables
    static let identifier = "MVCPatternQuestionGroupCell"
    // MARK: - Constructor
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureViews()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel.getDefaultLabel()
        label.textAlignment = .left
        return label
    }()
    
    lazy var percentageLabel: UILabel = {
        let label = UILabel.getDefaultLabel()
        label.textAlignment = .right
        return label
    }()
    
    // MARK: - Setup function
    func configureViews() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(percentageLabel)
    }
    
    func setupConstraints() {
        LayoutHelper.setEqualWidthHeight(contentView, sourceView: self)
        // Set Leading, top and Bottom
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: SpacingConstant.leadingSafeSpace).isActive = true
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        // Set Width(Trailing) and Height
        titleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.5).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
        
        percentageLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
        percentageLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -SpacingConstant.leadingSafeSpace).isActive = true
        percentageLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        percentageLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    // MARK: - Helper function
    func updateMutableConstraints() {
        
    }
    
    func updateWithModel(name: String, percentage: Double) {
        titleLabel.text = name
        percentageLabel.text = String(format: "%.0f", percentage)
    }
    
    // MARK: - View Controlls
    
    
    // MARK: - Delegate Controls

}
