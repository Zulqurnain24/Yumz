//
//  RunningView.swift
//  Yumz
//
//  Created by Muhammad Zulqurnain on 18/03/2023.
//

import SwiftUI

// MARK: - Screen for displaying the meal listing

struct MealListView : View {
  @ObservedObject var yumz: YumzStateStore
  
  var body: some View {
    VStack(content: content)
  }
  
  func content() -> AnyView {
    AnyView(ListContentView(yumz: yumz))
  }
}

extension MealListView: Equatable {
  static func == (lhs: MealListView, rhs: MealListView) -> Bool {
    lhs.yumz.self === rhs.yumz.self
  }
}

#if DEBUG
struct MealListView_Previews : PreviewProvider {
  static var previews: some View {
    MealListView(yumz: YumzStateStore())
  }
}
#endif
