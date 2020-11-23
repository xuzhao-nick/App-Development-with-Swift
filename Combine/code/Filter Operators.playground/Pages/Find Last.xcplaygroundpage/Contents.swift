//: [Previous](@previous)

import Foundation
import Combine
example(of: "last(where:)") {
  var subscriptions = Set<AnyCancellable>()
  let numbers = (1...9).publisher
  numbers
    .print("numbers")
    .last(where: { $0 % 2 == 0 })
    .sink( receiveCompletion: { print("Completed with: \($0)")},
    receiveValue: { print($0) })
    .store(in: &subscriptions)
}
