//
//  UniversitySharedRepository.swift
//  Invade-Task-VIPER
//
//  Created by Menaim on 02/05/2024.
//

import Foundation

public class UniversitySharedRepository {

  // MARK: - Properties
  private var university: UniversityItem?

  // MARK: - Singleton

  private init() { }

  public static var shared = UniversitySharedRepository()
}

// MARK: - UniversitySharedRepositoryProtocol

extension UniversitySharedRepository: UniversitySharedRepositoryProtocol {
  public func get() -> UniversityItem? {
    UniversitySharedRepository.shared.university
  }

  public func save(university: UniversityItem) {
    UniversitySharedRepository.shared.university = university
  }

  public func clear() {
    university = nil
  }
}
