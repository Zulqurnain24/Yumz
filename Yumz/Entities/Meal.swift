//
//  Meal.swift
//  Yumz
//
//  Created by Muhammad Zulqurnain on 16/03/2023.
//

import Foundation

// MARK: - Meal entity responsible for showing meal data

struct Meal: Codable, Identifiable {
    let id: String
    let name: String
    let category: String
    let instructions: String
    let thumbnail: String
    let youtube: String
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case name = "strMeal"
        case category = "strCategory"
        case instructions = "strInstructions"
        case thumbnail = "strMealThumb"
        case youtube = "strYoutube"
    }
}

extension Meal {
  static func mocked() -> Meal {
    return Meal(id: "1", name: "Chicken", category: "Non Veg", instructions: "(1)Make masala (2)Boil rice (3)Mix the 2 and simmer for 15 mins", thumbnail: "", youtube: "")
  }
}
