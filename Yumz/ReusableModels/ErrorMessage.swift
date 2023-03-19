//
//  ErrorMessage.swift
//  Yumz
//
//  Created by Muhammad Zulqurnain on 15/03/2023.
//

import Foundation

// MARK: - ErrorMessage struct

struct ErrorMessage: Error {
  let id = UUID()
  var message: String
}

protocol ErrorMessageConvertible {
  var errorMessage: ErrorMessage { get }
}

extension ErrorMessageConvertible {
  var errorMessage: ErrorMessage {
    ErrorMessage(message: "Unknown error. Please try again.")
  }
}
