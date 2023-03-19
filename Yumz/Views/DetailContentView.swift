//
//  DetailContentView.swift
//  Yumz
//
//  Created by Muhammad Zulqurnain on 19/03/2023.
//

import SwiftUI

// MARK: - view for showing the content of MealDetailView

struct DetailContentView: View {
  @Binding var meal: Meal
  @ObservedObject var yumz: MealsStateStore
  
  var body: some View {
    ScrollView {
      VStack(alignment: .leading) {
        RemoteImage(urlString: meal.thumbnail, placeholderImage: Image(""))
          .frame(maxWidth: .infinity, maxHeight: 600)
          .scaledToFit()
        
        VStack(alignment: .leading, spacing: 16) {
          Text(meal.name)
            .font(.title)
            .fontWeight(.bold)
          
          Text(meal.instructions)
            .font(.body)
            .multilineTextAlignment(.leading)
            .fixedSize(horizontal: false, vertical: true)
        }
        .padding()
      }
    }
    .navigationBarTitle(Text(meal.name), displayMode: .inline)
    .navigationBarBackButtonHidden(true)
    .navigationBarItems(leading: Button(action: {
      yumz.appState = .list
    }) {
      Image(systemName: "arrow.left")
        .foregroundColor(.blue)
        .imageScale(.large)
    }
    )
  }
}
