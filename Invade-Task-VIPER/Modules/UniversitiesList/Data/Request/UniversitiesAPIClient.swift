//
//  UniversitiesAPIClient.swift
//  Invade-Task-VIPER
//
//  Created by Menaim on 02/05/2024.
//

import Foundation

protocol UniversitiesAPIClientProtocol {
  func getUniversities(
    completion: @escaping(Result<UniversitiesNetworkResponse,SessionDataTaskError>) -> Void
  )
}

final class UniversitiesAPIClient {
  // MARK: - Dependencies
  private let client = BaseAPIClient.shared
}

// MARK: - UniversitiesAPIClientProtocol
extension UniversitiesAPIClient: UniversitiesAPIClientProtocol {
  func getUniversities(completion: @escaping (Result<UniversitiesNetworkResponse, SessionDataTaskError>) -> Void) {
    let request = UniversitiesAPIRequest.getUniversities
    client.perform(
      request,
      completion: completion
    )
  }
}
