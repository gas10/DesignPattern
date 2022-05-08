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
    func invokeMVC(_ pattern: Pattern) {
        switch pattern {
        case .mvc:
            present(MVCPatternVC())
        case .mvcQuestion:
            present(QuestionVC())
        case .delegation:
            present(QuestionGroupVC())
        case .strategy:
            present(QuestionGroupVC())
        case .singleton:
            present(AppSettingVC())
        case .memento:
            present(QuestionGroupVC())
        case .observer:
            present(QuestionGroupVC())
        default:
            break
        }
    }
    
    func present(_ vc: UIViewController) {
        let navigationVC = UINavigationController(rootViewController: vc)
        present(navigationVC, animated: true)
    }
}

protocol NavigationWorkflow {
    func invokeMVC(_ pattern: Pattern)
}

enum Pattern {
    case mvc
    case mvcQuestion
    case delegation
    case strategy
    case singleton
    case memento
    case observer
}
