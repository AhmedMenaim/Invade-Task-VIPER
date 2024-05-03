//
//  UniversityDetailsRouter.swift
//  Invade-Task-VIPER
//
//  Created by Menaim on 02/05/2024.
//

import UIKit

class UniversityDetailsRouter {

  // MARK: - Property

  weak var viewController: UIViewController?

  // MARK: - Lifecycle

  init() { }
}

// MARK: - UniversityDetailsRouterProtocol

extension UniversityDetailsRouter: UniversityDetailsRouterProtocol {
   func goBack() {
    self.viewController?.navigationController?.popViewController(animated: true)
  }
}
