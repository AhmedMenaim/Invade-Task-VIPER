//
//  UniversityDetailsInteractorModuleFactoryProtocol.swift
//  Invade-Task-VIPER
//
//
//  Created by Menaim on 02/05/2024.
//  
//

import Foundation

public protocol UniversityDetailsInteractorModuleFactoryProtocol {
  var output: UniversityDetailsInteractorOutput? { get set }
  func makeResponse(from request: UniversityDetailsInteractorModuleFactoryRequestProtocol) -> UniversityDetailsInteractorModuleFactoryResponseProtocol
}

public protocol UniversityDetailsInteractorModuleFactoryRequestProtocol {
}

public protocol UniversityDetailsInteractorModuleFactoryResponseProtocol {
  var interactor: UniversityDetailsInteractorInput { get }
}
