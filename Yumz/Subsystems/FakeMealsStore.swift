//
//  FakeMealsStore.swift
//  Yumz
//
//  Created by Muhammad Zulqurnain on 19/03/2023.
//

import Combine
import Foundation

class FakeMealsStore: MealsStorable {
  func getMealsData() -> Data {
    return Data()
  }
  
  var cancellables = Set<AnyCancellable>()
  func getMeals() -> Future<[Meal], CustomError> {
    Future { promise in
      promise(.success([Meal(id: "1", name: "Chicken", category: "Non Veg", instructions: "(1)Make masala (2)Boil rice (3)Mix the 2 and simmer for 15 mins", thumbnail: "", youtube: "")]))
    }
  }
  func saveMeals(_ meals: [Meal]) {}
  
}
