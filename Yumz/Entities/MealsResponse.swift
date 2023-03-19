//
//  MealsResponse.swift
//  Yumz
//
//  Created by Muhammad Zulqurnain on 16/03/2023.
//

import Foundation

// MARK: - Meals api response

struct MealsResponse: Codable {
  let meals: [Meal]
}
