//
//  UniversitiesListInteractorInput.swift
//  Invade-Task-VIPER
//
//  Mobissiweb template version 1.0
//
//  Created by Menaim on 02/05/2024.
//  
//

import Foundation

public protocol UniversitiesListInteractorInput {
  func retrieve()
  func numberOfCategories() -> Int
  func numberOfItems(for categoryIndex: Int) -> Int
  func item(atIndex index: Int, for categoryIndex: Int) -> UniversityItem?

}

public struct UniversityItem {
  let domains: [String]
  let stateProvince: String
  let name: String
  let webPages: [String]
  let country: String
  let alphaTwoCode: String
}
