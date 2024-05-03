//
//  UniversitiesListInteractorOutput.swift
//  Invade-Task-VIPER
//
//
//  Created by Menaim on 02/05/2024.
//
//

import Foundation

public protocol UniversitiesListInteractorOutput: AnyObject {
  func didUpdateTableView()
  func goToDetails()
  func notifyLoading()
  func notifyStopLoading()
  func notifyNoDataError()
  func notifyNetworkError()
  func notifyServerError()
}
