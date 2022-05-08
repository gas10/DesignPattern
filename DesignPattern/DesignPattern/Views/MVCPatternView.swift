//
//  MVCPatternVC.swift
//  DesignPattern
//
//  Created by Gawade, Amar on 5/3/22.
//

import Foundation
import UIKit
class MVCPatternView: UIView {
    // MARK: - Variables
    lazy var streetLabel: UILabel = {
        let label = UILabel.getDefaultLabel()
        label.numberOfLines = 3
        return label
    }()
    
    lazy var cityLabel: UILabel = {
        let label = UILabel.getDefaultLabel()
        return label
    }()
    
    lazy var stateLabel: UILabel = {
        let label = UILabel.getDefaultLabel()
        return label
    }()
    
    lazy var zipCodeLabel: UILabel = {
        let label = UILabel.getDefaultLabel()
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [streetLabel, cityLabel, stateLabel, zipCodeLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = SizeConstant.vstackSpacing
        stack.axis = .vertical
        stack.alignment = .center
        return stack
    }()
    
    // MARK: - Initializers
    init() {
        super.init(frame: .zero)
        backgroundColor = ColorConstant.mvcPatternViewBackgroundColor
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
        stackView.widthAnchor.constraint(equalToConstant: SizeConstant.labelWidth).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 4 * (SizeConstant.labelHeight + SizeConstant.vstackSpacing)).isActive = true
    }
    
    func updateWithModel(_ address: Address) {
        streetLabel.text = address.street
        cityLabel.text = address.city
        stateLabel.text = address.state
        zipCodeLabel.text = address.zipCode
    }
}
