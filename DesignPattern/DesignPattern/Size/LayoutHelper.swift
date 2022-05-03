//
//  LayoutHelper.swift
//  DesignPattern
//
//  Created by Gawade, Amar on 5/3/22.
//

import UIKit

class LayoutHelper {
    static func setEqualWidthHeight(_ targetView: UIView, sourceView: UIView) {
        targetView.translatesAutoresizingMaskIntoConstraints = false
        targetView.leadingAnchor.constraint(equalTo: sourceView.leadingAnchor).isActive = true
        targetView.trailingAnchor.constraint(equalTo: sourceView.trailingAnchor).isActive = true
        targetView.topAnchor.constraint(equalTo: sourceView.topAnchor).isActive = true
        targetView.bottomAnchor.constraint(equalTo: sourceView.bottomAnchor).isActive = true
    }
}
