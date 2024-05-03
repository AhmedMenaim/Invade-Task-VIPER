//
//  UniversityDetailsInteractorModuleFactory.swift
//  Invade-Task-VIPER
//
//
//  Created by Menaim on 02/05/2024.
//  
//

import Foundation

public final class UniversityDetailsInteractorModuleFactory: UniversityDetailsInteractorModuleFactoryProtocol {

  // MARK: - Property

  public weak var output: UniversityDetailsInteractorOutput? {
    didSet {
      interactor?.output = output
    }
  }

  private weak var interactor: UniversityDetailsInteractor?

  // MARK: - Lifecycle

  public init() {}

  // MARK: - UniversityDetailsInteractorInput

  public func makeResponse(from request: UniversityDetailsInteractorModuleFactoryRequestProtocol) -> UniversityDetailsInteractorModuleFactoryResponseProtocol {
    let dependencies = UniversityDetailsInteractorDependencies(
      dataSource: UniversityDetailsInteractorDataSource(),
      sharedRepository: UniversitySharedRepository.shared
    )
    let interactor = UniversityDetailsInteractor(dependencies: dependencies)
    self.interactor = interactor
    let response = UniversityDetailsInteractorModuleFactoryResponse(interactor: interactor)
    return response
  }
}

// MARK: - UniversityDetailsInteractorModuleFactoryResponseProtocol

private struct UniversityDetailsInteractorModuleFactoryResponse: UniversityDetailsInteractorModuleFactoryResponseProtocol {
  let interactor: UniversityDetailsInteractorInput
}

// MARK: - UniversityDetailsInteractorDependenciesProtocol

private struct UniversityDetailsInteractorDependencies: UniversityDetailsInteractorDependenciesProtocol {
  let dataSource: UniversityDetailsInteractorDataSourceProtocol
  let sharedRepository: UniversitySharedRepositoryProtocol
}
