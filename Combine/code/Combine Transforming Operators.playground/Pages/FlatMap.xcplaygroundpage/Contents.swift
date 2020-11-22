//: [Previous](@previous)

import Foundation
import Combine

example(of: "flatMap") {
  var subscriptions = Set<AnyCancellable>()
  func decode(_ codes: [Int]) -> AnyPublisher<String, Never> {
    Just(
      codes
        .compactMap { code in
          guard (32...255).contains(code) else { return nil }
          return String(UnicodeScalar(code) ?? " ")
        }
        .joined()
    )
    .eraseToAnyPublisher()
  }
  
  [72, 101, 108, 108, 111, 44, 32, 87, 111, 114, 108, 100, 33]
    .publisher
    .collect()
    .flatMap(decode)
    .sink(
      receiveValue: { print($0) })
    .store(in: &subscriptions)
}
