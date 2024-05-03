//
//  UniversitiesListViewController.swift
//  Invade-Task-VIPER
//
//  Created by Menaim on 02/05/2024.
//

import UIKit

protocol UniversitiesListViewDependenciesProtocol {
  var presenter: UniversitiesListPresenterInput! { get }
}

public class UniversitiesListViewController: UIViewController {
  // MARK: - Dependencies
  var dependencies: UniversitiesListViewDependenciesProtocol!

  // MARK: - Outlets
  @IBOutlet weak var universitiesTableView: UITableView!

  // MARK: - Properties
  var activityIndicator: UIActivityIndicatorView?

  // MARK: - Life Cycle

  private func configureActivityIndicator() {
    activityIndicator = UIActivityIndicatorView(style: .medium)
    activityIndicator?.center = view.center
    activityIndicator?.hidesWhenStopped = true
    if let activityIndicator {
      view.addSubview(activityIndicator)
    }
  }

  private func configureTableView() {
    universitiesTableView.dataSource = self
    universitiesTableView.delegate = self
    universitiesTableView.register(
      UINib(
        nibName: UniversityCell.identifier,
        bundle: nil
      ),
      forCellReuseIdentifier: UniversityCell.identifier
    )
  }

  public
  override func viewDidLoad() {
    super.viewDidLoad()
    configureActivityIndicator()
    configureTableView()
    dependencies.presenter.viewDidLoad()
  }
}

// MARK: - UniversitiesListPresenterOutput

extension UniversitiesListViewController: UniversitiesListPresenterOutput {
  func reloadData() {
    DispatchQueue.main.async { [weak self] in
      self?.universitiesTableView.reloadData()
    }
  }

  func displayServerError() {

  }

  func displayNetworkError() {

  }

  func displayNoDataError() {

  }

  func showLoading() {
    DispatchQueue.main.async { [weak self] in
      self?.activityIndicator?.startAnimating()
    }
  }

  func hideLoading() {
    DispatchQueue.main.async { [weak self] in
      self?.activityIndicator?.stopAnimating()
    }
  }
}

// MARK: - UITableViewDataSource
extension UniversitiesListViewController: UITableViewDataSource {
  public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    dependencies.presenter.numberOfRows(at: section)
  }

  public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard
      let viewItem = dependencies.presenter.viewItem(at: indexPath),
      let cell = tableView.dequeueReusableCell(
        withIdentifier: UniversityCell.identifier
      ) as?  UniversityCell
    else {
      return UITableViewCell()
    }
    cell.configure(viewItem)
    return cell
  }
}

// MARK: - UITableViewDelegate
extension UniversitiesListViewController: UITableViewDelegate {
  public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    dependencies.presenter.didSelectItem(at: indexPath)
  }
}
