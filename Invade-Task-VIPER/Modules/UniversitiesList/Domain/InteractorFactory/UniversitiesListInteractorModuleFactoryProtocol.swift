//
//  UniversitiesListInteractorModuleFactoryProtocol.swift
//  Invade-Task-VIPER
//
//  Mobissiweb template version 1.0
//
//  Created by Menaim on 02/05/2024.
//  
//

import Foundation

public protocol UniversitiesListInteractorModuleFactoryProtocol {
  var output: UniversitiesListInteractorOutput? { get set }
  func makeResponse(from request: UniversitiesListInteractorModuleFactoryRequestProtocol) -> UniversitiesListInteractorModuleFactoryResponseProtocol
}

public protocol UniversitiesListInteractorModuleFactoryRequestProtocol {
}

public protocol UniversitiesListInteractorModuleFactoryResponseProtocol {
  var interactor: UniversitiesListInteractorInput { get }
}
