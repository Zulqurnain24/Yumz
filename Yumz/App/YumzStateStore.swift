//
//  Yumz.swift
//  Yumz
//
//  Created by Muhammad Zulqurnain on 15/03/2023.
//

import Foundation
import SwiftUI
import Combine

// MARK: - MainView is the place where we house the routing of our app

final class YumzStateStore: ObservableObject {
    
  // MARK: AppState
  @Published var appState = AppState.launching(.starting)
  var anyCancellable: AnyCancellable
  
  // MARK: Dependencies
  let yumzDependencyContainer = YumzDependencyContainer()
  
  // MARK: Computed properties
  var isLaunching: Bool {
    return appState == .launching(.starting)
  }
  
  init() {
    anyCancellable = AnyCancellable{}
  }

  func startMealsUseCase() -> AnyPublisher<[Meal], CustomError> {
    appState = .list
    let usecase = self.yumzDependencyContainer.makeGetMealsUsecase()
    return usecase.start()
  }
}

// MARK: - Model

enum AppState {
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

extension AppState: Equatable {
  static func == (lhs: AppState, rhs: AppState) -> Bool {
    lhs.getID() == rhs.getID()
    
  }
}

enum LaunchState: Equatable {
  case starting
  case loadingMeals(AnyCancellable)
}
