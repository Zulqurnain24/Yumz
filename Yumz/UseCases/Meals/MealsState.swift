//
//  AppState.swift
//  Yumz
//
//  Created by Mohammad Zulqurnain on 19/03/2023.
//

import Combine

// MARK: - Model

enum MealsState {
  case launching(LaunchState)
  case list
  case detail(Meal)
  
  func getID() -> Int {
    switch self {
    case .launching: return 0
    case .list: return 1
    case .detail(_): return 2
    }
  }
}

extension MealsState: Equatable {
  static func == (lhs: MealsState, rhs: MealsState) -> Bool {
    lhs.getID() == rhs.getID()
    
  }
}

enum LaunchState: Equatable {
  case starting
  case loadingMeals(AnyCancellable)
}
