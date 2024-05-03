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
  func routeToDetails() {
    let dependencies = UniversityDetailsModuleFactoryDependencies(
      interactorFactory: UniversityDetailsInteractorModuleFactory()
    )
    let moduleFactory = UniversityDetailsModuleFactory(dependencies: dependencies)
    let detailsViewController = moduleFactory.makeView()
    self.viewController?.navigationController?.pushViewController(
      detailsViewController,
      animated: true
    )
  }
}

// MARK: - UniversityDetailsModuleFactoryDependenciesProtocol
private struct UniversityDetailsModuleFactoryDependencies: UniversityDetailsModuleFactoryDependenciesProtocol {
  var interactorFactory: UniversityDetailsInteractorModuleFactoryProtocol
}
