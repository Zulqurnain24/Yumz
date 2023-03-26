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
  let yumz = YumzStateStore()
  var body: some Scene {
    WindowGroup {
      MainView(yumz: yumz)
    }
  }
}
