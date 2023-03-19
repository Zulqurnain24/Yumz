//
//  YumzDependencyContainer.swift
//  Yumz
//
//  Created by Muhammad Zulqurnain on 15/03/2023.
//

import Foundation

// MARK: - MainView is the place where we house the routing of our app

final class YumzDependencyContainer {
  // MARK: Subsystems
  
  let mealsStore: MealsStorable = MealsStore()
  
  // MARK: Factories
  
  func makeGetMealsUsecase() -> MealsUseCase {

    let remoteAPI = makeMealsRemoteAPI()
    return MealsUseCase(mealsRemoteAPI: remoteAPI)
  }
  
  func makeMealsRemoteAPI() -> MealsRemoteAPIFetcheable {
    return FakeMealsAPI()
  }
}
