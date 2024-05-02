//
//  UniversitiesRepository.swift
//  Invade-Task-VIPER
//
//  Created by Menaim on 02/05/2024.
//

import Foundation

final class UniversitiesRepository {
  // MARK: - Dependencies
  private let client: UniversitiesAPIClientProtocol

  // MARK: - Life Cycle
  init(client: UniversitiesAPIClientProtocol) {
    self.client = client
  }

  // MARK: - Privates

  private func convert(_ response: UniversitiesNetworkResponse) -> UniversitiesRepositoryResponse {
    response.map { university in
      UniversityRepositoryResponse(
        domains: university.domains ?? [],
        stateProvince: university.stateProvince ?? "--",
        name: university.name ?? "--",
        webPages: university.webPages ?? [],
        country: university.country ?? "--",
        alphaTwoCode: university.alphaTwoCode ?? "--"
      )
    }
  }
}

// MARK: - UniversitiesRepositoryProtocol
extension UniversitiesRepository: UniversitiesRepositoryProtocol {
  func getUniversities(
    completion: @escaping (Result<UniversitiesRepositoryResponse, RepositoryError>) -> Void
  ) {
    client.getUniversities { [weak self] result in
      guard let self else {
        completion(.failure(
          RepositoryError(error: SessionDataTaskError.noData)
        ))
        return
      }
      switch result {
        case .success(let response):
          completion(.success(convert(response)))
        case .failure(let failure):
          completion(.failure(RepositoryError(error: failure)))
      }
    }
  }
}
