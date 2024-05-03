//
//  UniversityDetailsModuleFactory.swift
//  Invade-Task-VIPER
//
//  Created by Menaim on 02/05/2024.
//  
//

import UIKit

public protocol UniversityDetailsModuleFactoryProtocol {
  func makeView() -> UniversityDetailsViewController
}

public protocol UniversityDetailsModuleFactoryDependenciesProtocol {
  var interactorFactory: UniversityDetailsInteractorModuleFactoryProtocol { get }
}

public final class UniversityDetailsModuleFactory: UniversityDetailsViewDependenciesProtocol {

  // MARK: - Properties

  var presenter: UniversityDetailsPresenterInput!

  private var interactorFactory: UniversityDetailsInteractorModuleFactoryProtocol

  // MARK: - Lifecycle

  public init(dependencies: UniversityDetailsModuleFactoryDependenciesProtocol) {
    interactorFactory = dependencies.interactorFactory
  }

  // MARK: - Private

  private func makeInteractorModuleFactoryResponse() -> UniversityDetailsInteractorModuleFactoryResponseProtocol {
    let request = UniversityDetailsInteractorModuleFactoryRequest()
    return interactorFactory.makeResponse(from: request)
  }
}

// MARK: - HotelsListListContentModuleFactoryProtocol

extension UniversityDetailsModuleFactory: UniversityDetailsModuleFactoryProtocol {
  public
  func makeView() -> UniversityDetailsViewController {
    let interactorModuleFactoryResponse = makeInteractorModuleFactoryResponse()
    let router = UniversityDetailsRouter()
    let presenterDependencies = UniversityDetailsPresenterDependencies(
      interactor: interactorModuleFactoryResponse.interactor,
      router: router
    )
    let presenter = UniversityDetailsPresenter(dependencies: presenterDependencies)
    let viewController = UniversityDetailsViewController.loadFromNib()
    viewController.dependencies = self
    self.presenter = presenter
    interactorFactory.output = presenter
    presenter.output = viewController
    router.viewController = viewController
    return viewController
  }
}

// MARK: - UniversityDetailsInteractorModuleFactoryRequestProtocol

private struct UniversityDetailsInteractorModuleFactoryRequest: UniversityDetailsInteractorModuleFactoryRequestProtocol {
}

// MARK: - UniversityDetailsPresenterDependenciesProtocol

private struct UniversityDetailsPresenterDependencies: UniversityDetailsPresenterDependenciesProtocol {
  let interactor: UniversityDetailsInteractorInput
  let router: UniversityDetailsRouterProtocol
}
