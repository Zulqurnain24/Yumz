//
//  MainView.swift
//  Yumz
//
//  Created by Muhammad Zulqurnain on 15/03/2023.
//

import SwiftUI
// MARK: - MealsMainView is the place where we house the routing of our app

struct MealsMainView : View {
    @ObservedObject var mealsStore: MealsStateStore
    
    var body: some View {
        NavigationView {
            VStack(content: contentView)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    func contentView() -> AnyView {
        switch mealsStore.appState {
        case .launching:
            return AnyView(LaunchingView(yumz: mealsStore))
        case .list:
            return AnyView(MealListView(yumz: mealsStore))
        case .detail(let meal):
            return AnyView(MealDetailView(meal: meal, yumz: mealsStore))
        }
    }
}

#if DEBUG
struct MainView_Previews : PreviewProvider {
    static var previews: some View {
        MealsMainView(mealsStore: MealsStateStore())
    }
}
#endif
