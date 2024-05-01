//
//  BaseAPIClient.swift
//  Invade-Task-VIPER
//
//  Created by Menaim on 02/05/2024.
//

import Foundation

protocol BaseAPIClientProtocol {
  func perform<T: Codable>(
    _ configuration: APIRequestConfiguration,
    completion: @escaping (Result<T, SessionDataTaskError>) -> Void
  )
}

struct BaseAPIClient: BaseAPIClientProtocol {
  func perform<T: Codable>(_ configuration: APIRequestConfiguration,
                           completion: @escaping (
                            Result<T, SessionDataTaskError>
                           ) -> Void) {
    do {
      let request = try configuration.asURLRequest()
      let session = URLSession.shared
      session.dataTask(with: request as URLRequest) { data, response, error in
        if let error = error,
           let response = response as? HTTPURLResponse {
          let statusCode = response.statusCode
          switch statusCode {
              /// 1020 means dataNotAllowed -> Internet is closed
              /// 1009 Internet is opened but no connection happens
            case 1009, 1020:
              completion(.failure(.noInternetConnection))
              return
            case 404:
              completion(.failure(.notFound))
              return
            case 400:
              completion(.failure(.notAuthorized))
              return
            case 500 ... 599:
              completion(.failure(.server))
              return
            default:
              completion(.failure(SessionDataTaskError.failWithError(error)))
              return
          }
        }
        guard let data = data
        else {
          completion(.failure(SessionDataTaskError.noData))
          return
        }
        do {
          let decoder = JSONDecoder()
          let response = try decoder.decode(T.self, from: data)
          debugPrint(response)
          completion(.success(response))
        } catch {
          completion(.failure(SessionDataTaskError.failWithError(error)))
        }
      }
    } catch {
      completion(.failure(.requestFailed))
    }
  }
}
