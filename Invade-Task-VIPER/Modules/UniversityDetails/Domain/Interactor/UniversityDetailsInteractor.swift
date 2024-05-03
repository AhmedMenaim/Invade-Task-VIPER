//
//  UniversityDetailsInteractor.swift
//  Invade-Task-VIPER
//
//
//  Created by Menaim on 02/05/2024.
//
//

import Foundation

protocol UniversityDetailsInteractorDependenciesProtocol {
  var dataSource: UniversityDetailsInteractorDataSourceProtocol { get }
  var sharedRepository: UniversitySharedRepositoryProtocol { get }
}

final class UniversityDetailsInteractor {
  // MARK: - Property
  weak var output: UniversityDetailsInteractorOutput?
  private var dataSource: UniversityDetailsInteractorDataSourceProtocol
  private var sharedRepository: UniversitySharedRepositoryProtocol
  private let mainQueue = DispatchQueue.main

  // MARK: - Lifecycle
  init(dependencies: UniversityDetailsInteractorDependenciesProtocol) {
    dataSource = dependencies.dataSource
    sharedRepository = dependencies.sharedRepository
  }

  deinit {}

  // MARK: - Privates
  private func notifyNoDataError() {
    mainQueue.async { [weak self] in
      self?.output?.notifyNoDataError()
    }
  }
}

// MARK: - UniversityDetailsInteractorInput
extension UniversityDetailsInteractor: UniversityDetailsInteractorInput {
  func retrieve() {
    guard
      let university = sharedRepository.get()
    else {
      notifyNoDataError()
      return
    }
    dataSource.university = university
    output?.setDefaultValues(with: university)
  }

  func refresh() {
    NotificationCenter.default.post(
      name: Notification.Name("REFRESH"),
      object: nil
    )
    output?.goBack()
  }
}
