//
//  RecipiesStore.swift
//  Yumz
//
//  Created by Muhammad Zulqurnain on 15/03/2023.
//

import Foundation
import Combine


// MARK: - This class contains logic for the store for meals object

protocol MealsStorable {
  func getMeals() -> Future<[Meal], CustomError>
  func getMealsData() -> Data
  func saveMeals(_ meals: [Meal])
}

// MARK: - Implementation

class MealsStore: MealsStorable {
  func getMealsData() -> Data {
    OfflineStoreUserDefaults().getMealsData()
  }
  
  func saveMeals(_ meals: [Meal]) {
    OfflineStoreUserDefaults().saveMeals(meals)
  }
  
  func getMeals() -> Future<[Meal], CustomError> {
    OfflineStoreUserDefaults().getMeals()
  }
}
