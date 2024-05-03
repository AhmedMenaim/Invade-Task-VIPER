//
//  UniversitiesListInteractor.swift
//  Invade-Task-VIPER
//
//
//  Created by Menaim on 02/05/2024.
//
//

import Foundation

protocol UniversitiesListInteractorDependenciesProtocol {
  var dataSource: UniversitiesListInteractorDataSourceProtocol { get }
  var repository: UniversitiesRepositoryProtocol{ get }
  var sharedRepository: UniversitySharedRepositoryProtocol { get }
}

final class UniversitiesListInteractor {

  // MARK: - Constants
  private enum Constants {
    static let numberOfCategories = 1
  }

  // MARK: - Property
  weak var output: UniversitiesListInteractorOutput?
  private var dataSource: UniversitiesListInteractorDataSourceProtocol
  private var repository: UniversitiesRepositoryProtocol
  private var sharedRepository: UniversitySharedRepositoryProtocol
  private let mainQueue = DispatchQueue.main

  // MARK: - Lifecycle
  init(dependencies: UniversitiesListInteractorDependenciesProtocol) {
    dataSource = dependencies.dataSource
    repository = dependencies.repository
    sharedRepository = dependencies.sharedRepository
    addObservers()
  }

  deinit {}

  // MARK: - Privates
  private func addObservers() {
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(refreshList),
      name: Notification.Name("REFRESH"),
      object: nil
    )
  }

  @objc
  private func refreshList() {
    retrieve()
  }

  private func notifyNetworkError() {
    mainQueue.async { [weak self] in
      self?.output?.notifyNetworkError()
    }
  }

  private func notifyServerError() {
    mainQueue.async { [weak self] in
      self?.output?.notifyServerError()
    }
  }

  private func notifyNoDataError() {
    mainQueue.async { [weak self] in
      self?.output?.notifyNoDataError()
    }
  }

  private func manageRepositoryFailureError(_ error: RepositoryError) {
    DispatchQueue.global().async { [weak self] in
      switch error {
        case .noInternetConnection: self?.notifyNetworkError()
        default: self?.notifyServerError()
      }
    }
  }

  private func manageRepositoryResponse(_ response: UniversitiesRepositoryResponse) {
    let universities = response.map { university in
      UniversityItem(
        domains: university.domains,
        stateProvince: university.stateProvince,
        name: university.name,
        webPages: university.webPages,
        country: university.country,
        alphaTwoCode: university.alphaTwoCode
      )
    }
    dataSource.universitiesList = universities
    output?.didUpdateTableView()
    output?.notifyStopLoading()
  }
}

// MARK: - UniversitiesListInteractorInput
extension UniversitiesListInteractor: UniversitiesListInteractorInput {
  func retrieve() {
    output?.notifyLoading()
    repository.getUniversities { [weak self] result in
      guard let self else {
        self?.notifyNoDataError()
        return
      }
      switch result {
        case .success(let response):
          manageRepositoryResponse(response)
        case .failure(let error):
          manageRepositoryFailureError(error)
      }
    }
  }

  func numberOfCategories() -> Int {
    Constants.numberOfCategories
  }

  func numberOfItems(for categoryIndex: Int) -> Int {
    dataSource.universitiesList.count
  }

  func item(atIndex index: Int, for categoryIndex: Int) -> UniversityItem? {
    UniversityItem(
      domains: dataSource.universitiesList[index].domains,
      stateProvince: dataSource.universitiesList[index].stateProvince,
      name: dataSource.universitiesList[index].name,
      webPages: dataSource.universitiesList[index].webPages,
      country: dataSource.universitiesList[index].country,
      alphaTwoCode: dataSource.universitiesList[index].alphaTwoCode
      )
  }

  func goToUniversityDetails(atIndex index: Int, for categoryIndex: Int) {
    sharedRepository.save(university: dataSource.universitiesList[index])
    output?.goToDetails()
  }
}
