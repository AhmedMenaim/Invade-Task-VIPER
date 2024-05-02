//
//  UniversitiesAPIRequest.swift
//  Invade-Task-VIPER
//
//  Created by Menaim on 02/05/2024.
//

import Foundation

enum UniversitiesAPIRequest: APIRequestConfiguration {
  case getUniversities

  var method: HTTPMethod {
    switch self {
      case .getUniversities:
        return .GET
    }
  }

  var path: String {
    switch self {
      case .getUniversities:
        return "http://universities.hipolabs.com/search?country=United%20Arab%20Emirates"
    }
  }

  var parameters: Parameters? {
    nil
  }

  var headers: HTTPHeaders? {
    nil
  }

  var queryParams: [String : Any]? {
    nil
  }
}
