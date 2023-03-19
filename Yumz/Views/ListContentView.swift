//
//  ListView.swift
//  Yumz
//
//  Created by Muhammad Zulqurnain on 18/03/2023.
//

import Combine
import Foundation
import SwiftUI

// MARK: - View for MealListView Screen

struct ListContentView : View {
  @ObservedObject var yumz: MealsStateStore
  @State var meals: [Meal] = []
  @State private var isRefreshing = false
  
  var body: some View {
    var cancellables = Set<AnyCancellable>()
    List($meals) { meal in
      MealRow(meal: meal)
        .onTapGesture {
          yumz.appState = .detail(meal.wrappedValue)
        }
    }
    .onAppear {
      let _ = yumz.startMealsUseCase()
        .receive(on: DispatchQueue.main)
        .sink(receiveCompletion: { error in
          print("error: \(error)")
        }, receiveValue: { meals in
          self.meals = meals
        })
        .store(in: &cancellables)
    }
    .refreshable {
      isRefreshing.toggle()
      let _ = yumz.startMealsUseCase()
        .receive(on: DispatchQueue.main)
        .sink(receiveCompletion: { error in
          print("error: \(error)")
        }, receiveValue: { meals in
          self.meals = meals
        })
        .store(in: &cancellables)
    }
    .edgesIgnoringSafeArea(.bottom)
    .navigationBarTitle("Meals of today", displayMode: .large)
  }
}

#if DEBUG
struct ListContentView_Previews : PreviewProvider {
  static var previews: some View {
    ListContentView(yumz: MealsStateStore())
  }
}
#endif
