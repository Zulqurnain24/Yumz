//
//  FullscreenView.swift
//  Yumz
//
//  Created by Muhammad Zulqurnain on 18/03/2023.
//

import SwiftUI

// MARK: - Screen for showing the fullscreen view on splash screen

struct FullscreenView<Content: View> : View {
  let content: Content
  let backgroundColor: Color
  
  
  public init(backgroundColor: Color = Color.white,
              @ViewBuilder content: () -> Content) {
    self.backgroundColor = backgroundColor
    self.content = content()
  }
  
  var body: some View {
    HStack {
      Spacer()
      VStack {
        Spacer()
        content
        Spacer()
      }
      Spacer()
    }
    .background(backgroundColor)
    .edgesIgnoringSafeArea(.all)
  }
}

#if DEBUG
struct FullscreenView_Previews : PreviewProvider {
  static var previews: some View {
    FullscreenView {
      Text("Content")
    }
  }
}
#endif
