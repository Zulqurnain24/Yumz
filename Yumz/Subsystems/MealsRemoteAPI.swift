//
//  RecipiesRemoteAPI.swift
//  Yumz
//
//  Created by Muhammad Zulqurnain on 15/03/2023.
//

import Combine
import Foundation
import SwiftUI

// MARK: - API

protocol MealsRemoteAPIFetcheable {
  func getMeals() -> AnyPublisher<[Meal], CustomError>
}

// MARK: - Implementation

class MealsRemoteAPI: MealsRemoteAPIFetcheable {
  @Published var meals: [Meal] = []
  
  func getMeals() -> AnyPublisher<[Meal], CustomError> {
    guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?s=chicken") else {
      return Fail(error: .invalidURL).eraseToAnyPublisher()
    }
    
    return URLSession.shared.dataTaskPublisher(for: url)
      .tryMap { (data, response) -> Data in
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
          throw CustomError.serverDown
        }
        return data
      }
      .decode(type: MealsResponse.self, decoder: JSONDecoder())
      .map {
        MealsStore().saveMeals($0.meals)
        self.meals = $0.meals
        return self.meals
      }
      .catch { _ in MealsStore().getMeals() }
      .mapError { error -> CustomError in
        switch error {
        case is URLError:
          return .invalidURL
        case is DecodingError:
          return .decodingError
        default:
          return .invalidURL
        }
      }
      .eraseToAnyPublisher()
  }
}
