//: [Previous](@previous)

import Foundation
import Combine
example(of: "first(where:)") {
  var subscriptions = Set<AnyCancellable>()
  let numbers = (1...10_000).publisher
  numbers
    .print("numbers")
    .first(where: { $0 % 2 == 0 })
    .sink( receiveCompletion: { print("Completed with: \($0)")},
    receiveValue: { print($0) })
    .store(in: &subscriptions)
}
