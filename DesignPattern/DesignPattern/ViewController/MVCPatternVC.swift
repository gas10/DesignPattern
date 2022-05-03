//
//  MVCPatternVC.swift
//  DesignPattern
//
//  Created by Gawade, Amar on 5/3/22.
//

import UIKit

class MVCPatternVC: UIViewController {
    // MARK: - Variables
    var mvcPatternView: MVCPatternView?
    // Update view from model
    var address: Address? {
        didSet {
            updateViewFromAddress()
        }
    }
    // MARK: - Initializers
    init() {
        super.init(nibName: nil, bundle: nil)
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
        LayoutHelper.setEqualWidthHeight(mvcPatternView!, sourceView: view)
    }
    
    // MARK: - views method
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViewFromAddress()
    }
    
    func updateViewFromAddress() {
        guard let addressView = mvcPatternView else { return }
        guard let address = address else { return }
        addressView.updateWithModel(address)
    }
}
