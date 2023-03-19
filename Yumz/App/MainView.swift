//
//  MainView.swift
//  Yumz
//
//  Created by Muhammad Zulqurnain on 15/03/2023.
//

import SwiftUI
// MARK: - MainView is the place where we house the routing of our app

struct MainView : View {
  @ObservedObject var yumz: YumzStateStore
  
  var body: some View {
    NavigationView {
      VStack(content: contentView)
    }
    .navigationViewStyle(StackNavigationViewStyle())
  }
  
  func contentView() -> AnyView {
    switch yumz.appState {
    case .launching:
      return AnyView(LaunchingView(yumz: yumz))
    case .list:
      return AnyView(MealListView(yumz: yumz))
    case .detail(let meal):
      return AnyView(MealDetailView(meal: meal, yumz: yumz))
    }
  }
}

#if DEBUG
struct MainView_Previews : PreviewProvider {
  static var previews: some View {
    MainView(yumz: YumzStateStore())
  }
}
#endif
