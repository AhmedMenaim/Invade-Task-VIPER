//
//  UniversityDetailsInteractorOutput.swift
//  Invade-Task-VIPER
//
//
//  Created by Menaim on 02/05/2024.
//
//

import Foundation

public protocol UniversityDetailsInteractorOutput: AnyObject {
  func setDefaultValues(with university: UniversityItem)
  func notifyNoDataError()
  func goBack()
}
