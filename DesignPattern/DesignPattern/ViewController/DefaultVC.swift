//
//  DefaultVC.swift
//  DesignPattern
//
//  Created by Gawade, Amar on 5/6/22.
//

import UIKit
class DefaultVC: UIViewController {
    // MARK: - Variables
    // View
    var mvcPatternView: MVCPatternView?
    // Mode
    var address: Address?
        
    // MARK: - Initializers
    init() {
        super.init(nibName: nil, bundle: nil)
        title = LocalizationStrings.mvcLabel
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configuration
    func configure() {
        self.mvcPatternView = MVCPatternView()
        self.address = Address.getRandomAddress()
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(mvcPatternView!)
    }
    
    func setupConstraints() {
        LayoutHelper.setEqualWidthHeightWithSafeSpace(mvcPatternView!, sourceView: view)
    }
    
    // MARK: - views method
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// Delegates
extension DefaultVC {
    func invoke() {
        
    }
}
