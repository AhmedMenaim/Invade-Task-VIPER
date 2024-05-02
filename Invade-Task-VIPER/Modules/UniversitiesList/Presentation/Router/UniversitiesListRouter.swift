//
//  UniversitiesListRouter.swift
//  Invade-Task-VIPER
//
//  Created by Menaim on 02/05/2024.
//

import UIKit

class UniversitiesListRouter {

  // MARK: - Property

  weak var viewController: UIViewController?

  // MARK: - Lifecycle

  init() { }
}

// MARK: - UniversitiesListRouterProtocol

extension UniversitiesListRouter: UniversitiesListRouterProtocol {
   func goBack() {
    self.viewController?.navigationController?.popViewController(animated: true)
  }

   func routeToDetails() {
  }
}
