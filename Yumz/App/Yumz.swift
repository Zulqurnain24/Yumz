//
//  SceneDelegate.swift
//  Yumz
//
//  Created by Muhammad Zulqurnain on 15/03/2023.
//

import SwiftUI

// MARK: - This is the place from where the control initiates and a state object is passed into the instance of the MainView

@main
struct Yumz: App {
    let mealsStore = MealsStateStore()
    var body: some Scene {
        WindowGroup {
            MealsMainView(mealsStore: mealsStore)
        }
    }
}
