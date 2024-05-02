//
//  UIViewController+Extension.swift
//  Invade-Task-VIPER
//
//  Created by Menaim on 02/05/2024.
//

import UIKit

extension UIViewController {
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            let bundle = Bundle(for: T.self)
            return T(nibName: String(describing: T.self), bundle: bundle)
        }
        return instantiateFromNib()
    }
}
