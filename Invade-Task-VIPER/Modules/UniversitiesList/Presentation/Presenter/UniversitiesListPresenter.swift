//
//  UniversitiesListPresenter.swift
//  Invade-Task-VIPER
//
//  Created by Menaim on 02/05/2024.
//
//

import UIKit

protocol UniversitiesListPresenterDependenciesProtocol {
  var interactor: UniversitiesListInteractorInput { get }
  var router: UniversitiesListRouterProtocol { get }
}

final class UniversitiesListPresenter {

  // MARK: - Properties
  weak var output: UniversitiesListPresenterOutput?
  private let interactor: UniversitiesListInteractorInput
  private let router: UniversitiesListRouterProtocol

  // MARK: - Lifecycle

  init(dependencies: UniversitiesListPresenterDependenciesProtocol) {
    interactor = dependencies.interactor
    router = dependencies.router
  }
}

// MARK: - UniversitiesListPresenterInput
extension UniversitiesListPresenter: UniversitiesListPresenterInput {
  func viewDidLoad() {
    interactor.retrieve()
  }

  func numberOfSections() -> Int {
    interactor.numberOfCategories()
  }

  func numberOfRows(at section: Int) -> Int {
    interactor.numberOfItems(for: section)
  }

  func viewItem(at indexPath: IndexPath) -> UniversityViewItem? {
    guard
      let viewItem = interactor.item(
        atIndex: indexPath.row,
        for: indexPath.section
      ) else {
      output?.displayNoDataError()
      return nil
    }
    let name = viewItem.name
    let stateProvince = viewItem.stateProvince
    return UniversityViewItem(
      name: name,
      stateProvince: stateProvince
    )
  }

  func didSelectItem(at indexPath: IndexPath) {
    interactor.goToUniversityDetails(
      atIndex: indexPath.row,
      for: indexPath.section
    )
  }
}

// MARK: - UniversitiesListInteractorOutput
extension UniversitiesListPresenter: UniversitiesListInteractorOutput {
  func didUpdateTableView() {
    output?.reloadData()
  }

  func goToDetails() {
    router.routeToDetails()
  }

  func notifyLoading() {
    output?.showLoading()
  }

  func notifyStopLoading() {
    output?.hideLoading()
  }

  func notifyNoDataError() {
    output?.hideLoading()
    output?.displayNoDataError()
  }

  func notifyNetworkError() {
    output?.hideLoading()
    output?.displayNetworkError()
  }

  func notifyServerError() {
    output?.hideLoading()
    output?.displayServerError()
  }
}
