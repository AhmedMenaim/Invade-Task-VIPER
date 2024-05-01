//
//  Dictionary+Extensions.swift
//  Invade-Task-VIPER
//
//  Created by Menaim on 02/05/2024.
//

import Foundation

/// To be able to add two dictionaries to each other - You can check its usage in APIRequestConfiguration.swift file - Line 43
extension Dictionary {
  static func + (lhs: Dictionary, rhs: Dictionary?) -> Dictionary {
    if rhs == nil {
      return lhs
    } else {
      var dic = lhs
      rhs!.forEach { dic[$0] = $1 }
      return dic
    }
  }
}
