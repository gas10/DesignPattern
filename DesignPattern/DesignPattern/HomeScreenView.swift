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
    
    lazy var mvcButton: UIButton = {
        let button = UIButton()
        button.setTitle(LocalizationStrings.mvcLabel, for: .normal)
        button.addTarget(self, action: #selector(invokeMVC), for: .allEvents)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .green
        return button
    }()
    
    // MARK: - Initializers
    init(delegate: NavigationWorkflow) {
        super.init(frame: .zero)
        self.delegate = delegate
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
        self.addSubview(mvcButton)
    }
    
    func setupConstraints() {
        mvcButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        mvcButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        mvcButton.widthAnchor.constraint(equalToConstant: SizeConstant.mvcButtonWidth).isActive = true
        mvcButton.heightAnchor.constraint(equalToConstant: SizeConstant.mvcButtonHeight).isActive = true
    }
}
// MARK: - Deleagtes
extension HomeScreenView {
    @objc func invokeMVC() {
        delegate?.invokeMVC()
    }
}
