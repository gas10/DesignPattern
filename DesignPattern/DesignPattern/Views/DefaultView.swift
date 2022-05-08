//
//  DefaultView.swift
//  DesignPattern
//
//  Created by Gawade, Amar on 5/6/22.
//

import Foundation
import UIKit
class TestView: UIView {
    // MARK: - Variables

    // MARK: - Constructor
    init() {
        super.init(frame: .zero)
        configureViews()
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
    func configureViews() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        
    }
    
    func setupConstraints() {
        
    }
    
    // MARK: - Helper function
    func updateMutableConstraints() {
        
    }
    
    func updateWithModel() {
        
    }
    
    // MARK: - View Controlls
    
    
    // MARK: - Delegate Controls
}

// MARK: - Extensions
