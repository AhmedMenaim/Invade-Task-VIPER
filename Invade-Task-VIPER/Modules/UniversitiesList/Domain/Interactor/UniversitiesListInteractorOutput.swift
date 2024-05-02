//
//  UniversitiesListInteractorOutput.swift
//  Invade-Task-VIPER
//
//  Mobissiweb template version 1.0
//
//  Created by Menaim on 02/05/2024.
//
//

import Foundation

public protocol UniversitiesListInteractorOutput: AnyObject {
  func setDefaultValues()
  func didUpdateTableView()
  func notifyLoading()
  func notifyNoDataError()
  func notifyNetworkError()
  func notifyServerError()
}
