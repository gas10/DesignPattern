//
//  HomeScreenView.swift
//  DesignPattern
//
//  Created by Gawade, Amar on 5/3/22.
//

import Foundation
import UIKit
class HomeScreenView: UIView {
    // MARK: - Variables
    var delegate: NavigationWorkflow?
    
    lazy var buttons: [UIButton] = {
        var homeButtons = [UIButton]()
        for label in LocalizationStrings.patternLabelMap.keys {
            let button = UIButton.getDefaultButton(for: label)
            button.addTarget(self, action: #selector(invokeMVC), for: .allEvents)
            homeButtons.append(button)
        }
        return homeButtons
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: buttons)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = SizeConstant.vstackSpacing
        stack.axis = .vertical
        stack.alignment = .center
        return stack
    }()
    
    // MARK: - Initializers
    init(delegate: NavigationWorkflow) {
        super.init(frame: .zero)
        self.delegate = delegate
        self.backgroundColor = ColorConstant.homeScreenViewColor
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Methods
    func configure() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        self.addSubview(stackView)
    }
    
    func setupConstraints() {
        for button in buttons {
            button.widthAnchor.constraint(equalToConstant: SizeConstant.homeScreenLabelWidth).isActive = true
        }
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
}
// MARK: - Deleagtes
extension HomeScreenView {
    @objc func invokeMVC(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        guard let label =  button.titleLabel?.text, let vc = LocalizationStrings.patternLabelMap[label] else { return }
        delegate?.invokeMVC(vc)
    }
}
