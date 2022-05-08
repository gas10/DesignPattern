//
//  ButtonExtension.swift
//  DesignPattern
//
//  Created by Gawade, Amar on 5/6/22.
//

import Foundation
import UIKit
extension UIButton {
    static func getDefaultButton(for name: String) -> UIButton {
        let button = UIButton()
        button.setTitle(name, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = SizeConstant.cornerRadius
        return button
    }
}


extension UILabel {
    static func getDefaultLabel() -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }
}
