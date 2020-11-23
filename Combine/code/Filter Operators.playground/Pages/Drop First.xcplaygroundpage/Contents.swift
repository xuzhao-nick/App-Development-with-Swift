//: [Previous](@previous)

import Foundation
import Combine
example(of: "dropFirst") {
  var subscriptions = Set<AnyCancellable>()
  let numbers = (1...10).publisher
  numbers
    .dropFirst(8)
    .sink( receiveCompletion: { print("Completed with: \($0)")},
    receiveValue: { print($0) })
    .store(in: &subscriptions)
}
