//
//  BaseAPIRequest.swift
//  Invade-Task-VIPER
//
//  Created by Menaim on 02/05/2024.
//

import Foundation

enum BaseAPIRequest: APIRequestConfiguration {

  // MARK: - HTTPMethod
  internal var method: HTTPMethod {
    switch self {
      default:
        return .GET
    }
  }

  // MARK: - Path
  var path: String {
    return ""
  }

  // MARK: - Parameters
  var parameters: Parameters? {
    return [:]
  }

  // MARK: - Headers
  var headers: HTTPHeaders? {
    return nil
  }

  // MARK: - Query Params
  var queryParams: [String : Any]? {
    return nil
  }
}
