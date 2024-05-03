//
//  PrintIfDebug.swift
//  Invade-Task-VIPER
//
//  Created by Menaim on 03/05/2024.
//

import Foundation

public func print(_ items: Any..., separator: String = " ", terminator: String = "\n") {
  #if DEBUG
  Swift.print(items, separator: separator, terminator: terminator)
  #endif
}
