//
//  RecipiesUseCase.swift
//  Yumz
//
//  Created by Muhammad Zulqurnain on 15/03/2023.
//

import Combine
import Foundation
import SwiftUI

// MARK: - This usecase houses the business logic for retreiving meals from the webservice

class MealsUseCase {
  let mealsRemoteAPI: MealsRemoteAPIFetcheable
  
  init(mealsRemoteAPI: MealsRemoteAPIFetcheable) {
    self.mealsRemoteAPI = mealsRemoteAPI
  }
  
  func start() -> AnyPublisher<[Meal], CustomError> {
    let future = mealsRemoteAPI.getMeals()
    return future
  }
}
