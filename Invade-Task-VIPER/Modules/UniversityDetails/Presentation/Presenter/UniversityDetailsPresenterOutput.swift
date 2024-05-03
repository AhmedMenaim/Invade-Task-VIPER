//
//  UniversityDetailsPresenterOutput.swift
//  Invade-Task-VIPER
//
//  Created by Menaim on 02/05/2024.
//
//

import UIKit

protocol UniversityDetailsPresenterOutput: AnyObject {
  func showDetails(_ details: UniversityDetailsViewItem)
  func displayNoDataError()
}

struct UniversityDetailsViewItem {
  let stateProvince: String
  let name: String
  let webPage: String
  let country: String
  let alphaTwoCode: String
}
