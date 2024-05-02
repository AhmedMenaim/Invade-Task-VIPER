//
//  UniversitiesRepositoryProtocol.swift
//  Invade-Task-VIPER
//
//  Created by Menaim on 02/05/2024.
//

import Foundation

protocol UniversitiesRepositoryProtocol {
  func getUniversities(
    completion: @escaping(Result<UniversitiesRepositoryResponse, RepositoryError>) -> Void
  )
}
