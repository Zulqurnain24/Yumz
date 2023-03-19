//
//  DetailView.swift
//  Yumz
//
//  Created by Muhammad Zulqurnain on 19/03/2023.
//

import SwiftUI

// MARK: - Screen for displaying the detail of meal

struct MealDetailView: View {
  @State var meal: Meal = Meal(id: "", name: "", category: "", instructions: "", thumbnail: "", youtube: "")
  @ObservedObject var yumz: MealsStateStore
  
  var body: some View {
    VStack(content: content)
  }
  
  func content() -> AnyView {
    AnyView(DetailContentView(meal: $meal, yumz: yumz))
  }
}

extension MealDetailView: Equatable {
  static func == (lhs: MealDetailView, rhs: MealDetailView) -> Bool {
    lhs.meal.id == rhs.meal.id
  }
}

#if DEBUG
struct MealDetailView_Previews : PreviewProvider {
  static var previews: some View {
    MealDetailView(meal: Meal.mocked(), yumz: MealsStateStore())
  }
}
#endif
