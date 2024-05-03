//
//  UniversitySharedRepositoryProtocol.swift
//  Invade-Task-VIPER
//
//  Created by Menaim on 02/05/2024.
//

import Foundation

public protocol UniversitySharedRepositoryProtocol: UniversitySharedRepositoryGettable,
  UniversitySharedRepositorySavable,
  UniversitySharedRepositoryClearable { }

public protocol UniversitySharedRepositoryGettable {
  func get() -> UniversityItem?
}

public protocol UniversitySharedRepositorySavable {
  func save(university: UniversityItem)
}

public protocol UniversitySharedRepositoryClearable {
  func clear()
}
