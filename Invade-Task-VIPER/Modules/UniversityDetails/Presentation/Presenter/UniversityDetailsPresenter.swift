//
//  UniversityDetailsPresenter.swift
//  Invade-Task-VIPER
//
//  Created by Menaim on 02/05/2024.
//
//

import UIKit

protocol UniversityDetailsPresenterDependenciesProtocol {
  var interactor: UniversityDetailsInteractorInput { get }
  var router: UniversityDetailsRouterProtocol { get }
}

final class UniversityDetailsPresenter {

  // MARK: - Properties
  weak var output: UniversityDetailsPresenterOutput?
  private let interactor: UniversityDetailsInteractorInput
  private let router: UniversityDetailsRouterProtocol

  // MARK: - Lifecycle

  init(dependencies: UniversityDetailsPresenterDependenciesProtocol) {
    interactor = dependencies.interactor
    router = dependencies.router
  }
}

// MARK: - UniversityDetailsPresenterInput
extension UniversityDetailsPresenter: UniversityDetailsPresenterInput {
  func viewDidLoad() {
    interactor.retrieve()
  }

  func reloadList() {
    interactor.refresh()
  }
}

// MARK: - UniversityDetailsInteractorOutput
extension UniversityDetailsPresenter: UniversityDetailsInteractorOutput {
  func setDefaultValues(with university: UniversityItem) {
    let details = UniversityDetailsViewItem(
      stateProvince: university.stateProvince,
      name: university.name,
      webPage: university.webPages.first ?? "",
      country: university.country,
      alphaTwoCode: university.alphaTwoCode
    )
    output?.showDetails(details)
  }

  func notifyNoDataError() {
    output?.displayNoDataError()
  }

  func goBack() {
    router.goBack()
  }
}
