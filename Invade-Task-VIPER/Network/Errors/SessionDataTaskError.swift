//
//  SessionDataTaskError.swift
//  Invade-Task-VIPER
//
//  Created by Menaim on 02/05/2024.
//

import Foundation

enum SessionDataTaskError: Error {
  case failWithError(Error)
  case notValidURL
  case requestFailed
  case noData
  case notFound
  case notAuthorized
  case server
  case noInternetConnection
  case emptyErrorWithStatusCode(String)
}
