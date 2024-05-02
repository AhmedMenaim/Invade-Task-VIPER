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

  // MARK: - Lifecycle

  init(dependencies: UniversitiesListPresenterDependenciesProtocol) {
    interactor = dependencies.interactor
  }

  // MARK: - Privates

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
}

// MARK: - UniversitiesListInteractorOutput
extension UniversitiesListPresenter: UniversitiesListInteractorOutput {
  func setDefaultValues() {
  }

  func didUpdateTableView() {
    output?.reloadData()
  }

  func notifyLoading() {
    output?.showLoading()
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
