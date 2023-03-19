//
//  RemoteImage.swift
//  Yumz
//
//  Created by Muhammad Zulqurnain on 19/03/2023.
//

import SwiftUI
import Combine

// MARK: - This is for displaying an image from internet

struct RemoteImage: View {
  let urlString: String
  let placeholderImage: Image
  
  @StateObject private var imageLoader = ImageLoader()
  
  var body: some View {
    Group {
      if let image = imageLoader.image {
        Image(uiImage: image)
          .resizable()
          .scaledToFit()
      } else {
        placeholderImage
          .resizable()
          .scaledToFit()
      }
    }
    .onAppear {
      guard let url = URL(string: urlString) else { return }
      imageLoader.loadImage(from: url)
    }
  }
}

private class ImageLoader: ObservableObject {
  @Published var image: UIImage?
  private var cancellable: AnyCancellable?
  
  func loadImage(from url: URL) {
    cancellable = URLSession.shared.dataTaskPublisher(for: url)
      .map { UIImage(data: $0.data) }
      .replaceError(with: nil)
      .receive(on: DispatchQueue.main)
      .assign(to: \.image, on: self)
  }
}
