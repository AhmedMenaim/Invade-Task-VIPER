//
//  UniversitiesListModuleFactory.swift
//  Invade-Task-VIPER
//
//  Created by Menaim on 02/05/2024.
//  
//

import UIKit

public protocol UniversitiesListModuleFactoryProtocol {
  func makeView() -> UniversitiesListViewController
}

public protocol UniversitiesListModuleFactoryDependenciesProtocol {
  var interactorFactory: UniversitiesListInteractorModuleFactoryProtocol { get }
}

public final class UniversitiesListModuleFactory: UniversitiesListViewDependenciesProtocol {

  // MARK: - Properties

  var presenter: UniversitiesListPresenterInput!

  private var interactorFactory: UniversitiesListInteractorModuleFactoryProtocol

  // MARK: - Lifecycle

  public init(dependencies: UniversitiesListModuleFactoryDependenciesProtocol) {
    interactorFactory = dependencies.interactorFactory
  }

  // MARK: - Private

  private func makeInteractorModuleFactoryResponse() -> UniversitiesListInteractorModuleFactoryResponseProtocol {
    let request = UniversitiesListInteractorModuleFactoryRequest()
    return interactorFactory.makeResponse(from: request)
  }
}

// MARK: - HotelsListListContentModuleFactoryProtocol

extension UniversitiesListModuleFactory: UniversitiesListModuleFactoryProtocol {
  public
  func makeView() -> UniversitiesListViewController {
    let interactorModuleFactoryResponse = makeInteractorModuleFactoryResponse()
    let router = UniversitiesListRouter()
    let presenterDependencies = UniversitiesListPresenterDependencies(
      interactor: interactorModuleFactoryResponse.interactor,
      router: router
    )
    let presenter = UniversitiesListPresenter(dependencies: presenterDependencies)
    let viewController = UniversitiesListViewController.loadFromNib()
    viewController.dependencies = self
    self.presenter = presenter
    interactorFactory.output = presenter
    presenter.output = viewController
    router.viewController = viewController
    return viewController
  }
}

// MARK: - UniversitiesListInteractorModuleFactoryRequestProtocol

private struct UniversitiesListInteractorModuleFactoryRequest: UniversitiesListInteractorModuleFactoryRequestProtocol {
}

// MARK: - UniversitiesListPresenterDependenciesProtocol

private struct UniversitiesListPresenterDependencies: UniversitiesListPresenterDependenciesProtocol {
  let interactor: UniversitiesListInteractorInput
  let router: UniversitiesListRouterProtocol
}
