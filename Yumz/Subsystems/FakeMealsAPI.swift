//
//  FakeMealsAPI.swift
//  Yumz
//
//  Created by Muhammad Zulqurnain on 18/03/2023.
//

import Combine
import SwiftUI

// MARK: - Fake MealsAPI implementation

class FakeMealsAPI: MealsRemoteAPIFetcheable {
  @Published var meals: [Meal] = []
  
  func getMeals() -> AnyPublisher<[Meal], CustomError> {
    let mealsResponse: MealsResponse = load("meals")
    return Just(mealsResponse.meals)
      .setFailureType(to: CustomError.self)
      .eraseToAnyPublisher()
  }
  
  private func load<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
    guard let file = Bundle.main.url(forResource: filename, withExtension: "json") else {
      fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
      let data = try Data(contentsOf: file)
      let decoder = JSONDecoder()
      return try decoder.decode(T.self, from: data)
    } catch {
      fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
  }
}
