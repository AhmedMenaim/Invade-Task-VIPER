//
//  UniversitiesListPresenterInput.swift
//  Invade-Task-VIPER
//
//  Created by Menaim on 02/05/2024.
//  
//

import UIKit

protocol UniversitiesListPresenterInput {
  func viewDidLoad()
  func numberOfSections() -> Int
  func numberOfRows(at section: Int) -> Int
  func viewItem(at indexPath: IndexPath) -> UniversityViewItem?
}

struct UniversityViewItem {
  let name: String
  let stateProvince: String
}
