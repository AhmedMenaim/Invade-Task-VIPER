//
//  UniversityDetailsViewController.swift
//  Invade-Task-VIPER
//
//  Created by Menaim on 02/05/2024.
//

import UIKit

protocol UniversityDetailsViewDependenciesProtocol {
  var presenter: UniversityDetailsPresenterInput! { get }
}

public class UniversityDetailsViewController: UIViewController {
  // MARK: - Dependencies
  var dependencies: UniversityDetailsViewDependenciesProtocol!

  // MARK: - Outlets
  @IBOutlet weak var universityNameLabel: UILabel!
  @IBOutlet weak var universityStateLabel: UILabel!
  @IBOutlet weak var universityCountryLabel: UILabel!
  @IBOutlet weak var universityCountryCodeLabel: UILabel!
  @IBOutlet weak var universityWebPageLabel: UILabel!

  // MARK: - Life Cycle
  public
  override func viewDidLoad() {
    super.viewDidLoad()
    dependencies.presenter.viewDidLoad()
  }

  // MARK: - Actions
  @IBAction func didTapRefreshButton(_ sender: Any) {
    dependencies.presenter.reloadList()
  }
}

// MARK: - UniversityDetailsPresenterOutput

extension UniversityDetailsViewController: UniversityDetailsPresenterOutput {
  func showDetails(_ details: UniversityDetailsViewItem) {
    universityNameLabel.text = details.name
    universityStateLabel.text = details.stateProvince
    universityCountryLabel.text = details.country
    universityCountryCodeLabel.text = details.alphaTwoCode
    universityWebPageLabel.text = details.webPage
  }
  
  func displayNoDataError() {
  }
}
