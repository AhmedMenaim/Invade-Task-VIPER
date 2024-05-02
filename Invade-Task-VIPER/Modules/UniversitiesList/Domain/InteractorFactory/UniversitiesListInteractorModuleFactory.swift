//
//  UniversitiesListInteractorModuleFactory.swift
//  Invade-Task-VIPER
//
//  Mobissiweb template version 1.0
//
//  Created by Menaim on 02/05/2024.
//  
//

import Foundation

public final class UniversitiesListInteractorModuleFactory: UniversitiesListInteractorModuleFactoryProtocol {

  // MARK: - Property

  public weak var output: UniversitiesListInteractorOutput? {
    didSet {
      interactor?.output = output
    }
  }

  private weak var interactor: UniversitiesListInteractor?

  // MARK: - Lifecycle

  public init() {}

  // MARK: - UniversitiesListInteractorInput

  public func makeResponse(from request: UniversitiesListInteractorModuleFactoryRequestProtocol) -> UniversitiesListInteractorModuleFactoryResponseProtocol {
    let dependencies = UniversitiesListInteractorDependencies(
      dataSource: UniversitiesListInteractorDataSource(),
      repository: UniversitiesRepository(
        client: UniversitiesAPIClient()
      )
    )
    let interactor = UniversitiesListInteractor(dependencies: dependencies)
    self.interactor = interactor
    let response = UniversitiesListInteractorModuleFactoryResponse(interactor: interactor)
    return response
  }
}

// MARK: - UniversitiesListInteractorModuleFactoryResponseProtocol

private struct UniversitiesListInteractorModuleFactoryResponse: UniversitiesListInteractorModuleFactoryResponseProtocol {
  let interactor: UniversitiesListInteractorInput
}

// MARK: - UniversitiesListInteractorDependenciesProtocol

private struct UniversitiesListInteractorDependencies: UniversitiesListInteractorDependenciesProtocol {
  let dataSource: UniversitiesListInteractorDataSourceProtocol
  let repository: UniversitiesRepositoryProtocol
}
