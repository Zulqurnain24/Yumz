//
//  MealRow.swift
//  Yumz
//
//  Created by Muhammad Zulqurnain on 19/03/2023.
//

import Foundation
import SwiftUI

// MARK: - view for showing row content of MealListView Screen

struct MealRow: View {
  @Binding var meal: Meal
  
  var body: some View {
    HStack(spacing: 16) {
      VStack(alignment: .leading) {
        RemoteImage(urlString: meal.thumbnail, placeholderImage: Image(""))
          .frame(width: 60, height: 60)
        VStack(alignment: .leading) {
          Text(meal.name)
            .font(.headline)
          Text(meal.instructions)
            .font(.subheadline)
            .lineLimit(2)
        }
      }
    }
  }
}
