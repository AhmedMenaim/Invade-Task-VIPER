//
//  UniversitiesListPresenterOutput.swift
//  Invade-Task-VIPER
//
//  Created by Menaim on 02/05/2024.
//  
//

import UIKit

protocol UniversitiesListPresenterOutput: AnyObject {
  func showLoading()
  func hideLoading()
  func reloadData()
  func displayServerError()
  func displayNetworkError()
  func displayNoDataError()
}
