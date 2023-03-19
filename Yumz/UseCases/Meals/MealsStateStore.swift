//
//  Yumz.swift
//  Yumz
//
//  Created by Muhammad Zulqurnain on 15/03/2023.
//

import Foundation
import SwiftUI
import Combine

// MARK: - YumzStateStore is the place where we have the appstate logic

final class MealsStateStore: ObservableObject {

  @Published var appState = MealsState.launching(.starting)
  var anyCancellable: AnyCancellable
  
  // MARK: Dependencies
  let fetchMealsDependencyContainer = MealsFetchDependencyContainer()
  
  // MARK: Computed properties
  var isLaunching: Bool {
    return appState == .launching(.starting)
  }
  
  init() {
    anyCancellable = AnyCancellable{}
  }

  func startMealsUseCase() -> AnyPublisher<[Meal], CustomError> {
    appState = .list
    let usecase = self.fetchMealsDependencyContainer.makeGetMealsUsecase()
    return usecase.start()
  }
}
