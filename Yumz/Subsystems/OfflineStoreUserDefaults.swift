//
//  store.swift
//  Yumz
//
//  Created by Muhammad Zulqurnain on 18/03/2023.
//

import Combine
import Foundation

// MARK: - This class is for setting and retreiving persistent store values

class OfflineStoreUserDefaults: MealsStorable {
  func getMealsData() -> Data {
    if let mealsData = UserDefaults.standard.data(forKey: mealsKey) {
      return mealsData
    } else {
      return Data()
    }
  }
  
  let mealsKey = "Meals"
  func getMeals() -> Future<[Meal], CustomError> {
    if let mealsData = UserDefaults.standard.data(forKey: mealsKey),
       let meals = try? JSONDecoder().decode([Meal].self, from: mealsData) {
      return Future { promise in
        promise(.success(meals))
      }
    }
    return Future { promise in
      promise(.failure(CustomError.noDataReturned))
    }
  }
  
  func saveMeals(_ meals: [Meal]) {
    if let mealsData = try? JSONEncoder().encode(meals) {
      UserDefaults.standard.set(mealsData, forKey: mealsKey)
    }
  }
  
}
