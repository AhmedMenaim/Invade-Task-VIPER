//
//  UITableViewCell+Identifier.swift
//  Invade-Task-VIPER
//
//  Created by Menaim on 02/05/2024.
//

import UIKit

extension UITableViewCell {
    static var identifier: String {
        String(describing: Self.self)
    }
}
