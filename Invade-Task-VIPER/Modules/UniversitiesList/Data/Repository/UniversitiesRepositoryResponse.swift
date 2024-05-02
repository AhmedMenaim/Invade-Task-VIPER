//
//  UniversitiesRepositoryResponse.swift
//  Invade-Task-VIPER
//
//  Created by Menaim on 02/05/2024.
//

import Foundation

// MARK: - UniversityRepositoryResponse
struct UniversityRepositoryResponse {
  let domains: [String]
  let stateProvince: String
  let name: String
  let webPages: [String]
  let country: String
  let alphaTwoCode: String
}

typealias UniversitiesRepositoryResponse = [UniversityRepositoryResponse]
