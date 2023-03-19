//
//  LaunchingView.swift
//  Yumz
//
//  Created by Muhammad Zulqurnain on 18/03/2023.
//

import SwiftUI

// MARK: - Launch Screen

struct LaunchingView : View {
  @ObservedObject var yumz: MealsStateStore
  
  var body: some View {
    NavigationView {
      FullscreenView(backgroundColor: Color("BackgroundColor")) {
        VStack(alignment: .center) {
          Image("yumz")
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)
          Text("Welcome to Yumz App!")
            .font(.title)
            .fontWeight(.bold)
            .padding(.top, 20)
        }
      }.onAppear {
        self.gotoMealsScreen(time: AppConstants.splashAnimationTime)
      }
    }
  }
  
  func gotoMealsScreen(time: Double) {
    DispatchQueue.main.asyncAfter(deadline: .now() + Double(time)) {
      self.yumz.appState = .list
    }
  }
}

#if DEBUG
struct LaunchingView_Previews : PreviewProvider {
  static var previews: some View {
    LaunchingView(yumz: MealsStateStore())
  }
}
#endif

