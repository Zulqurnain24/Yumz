//
//  YumzDependencyContainer.swift
//  Yumz
//
//  Created by Muhammad Zulqurnain on 15/03/2023.
//

import Foundation

// MARK: - FetchMealsDependencyContainer is the place where we house the factory related logic pertaining to specific usecase

final class MealsFetchDependencyContainer {
  // MARK: Subsystems
  
  let mealsStore: MealsStorable = MealsStore()
  
  // MARK: Factories
  
  func makeGetMealsUsecase() -> MealsUseCase {

    let remoteAPI = makeMealsRemoteAPI()
    return MealsUseCase(mealsRemoteAPI: remoteAPI)
  }
  
  func makeMealsRemoteAPI() -> MealsRemoteAPIFetcheable {
    return MealsRemoteAPI()
  }
}
