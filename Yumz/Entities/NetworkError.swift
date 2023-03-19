//
//  NetworkError.swift
//  Yumz
//
//  Created by Muhammad Zulqurnain on 18/03/2023.
//

import Combine
import Foundation

// MARK: - Network error handling

enum CustomError: Error {
  case invalidURL
  case noDataReturned
  case decodingError
  case serverDown
}
