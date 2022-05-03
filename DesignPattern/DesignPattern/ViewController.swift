//
//  ViewController.swift
//  DesignPattern
//
//  Created by Gawade, Amar on 5/3/22.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Variables
    var homescreenView: HomeScreenView!
    
//    // MARK: - Initializers
//    init() {
//        super.init(nibName: nil, bundle: nil)
//        configure()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }
    
    func configure() {
        self.homescreenView = HomeScreenView(delegate: self)
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        view.addSubview(homescreenView)
    }
    
    func setupConstraints() {
        LayoutHelper.setEqualWidthHeight(homescreenView, sourceView: view)
    }
    
    // MARK: - views method
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        // Do any additional setup after loading the view.
        
    }
}

// MARK: - Delegates
extension ViewController: NavigationWorkflow {
    // Delegates handling
    func invokeMVC() {
        let mvcVC = MVCPatternVC()
        mvcVC.modalPresentationStyle = .formSheet
        present(mvcVC, animated: false, completion: nil)
    }
}

protocol NavigationWorkflow {
    func invokeMVC()
}
