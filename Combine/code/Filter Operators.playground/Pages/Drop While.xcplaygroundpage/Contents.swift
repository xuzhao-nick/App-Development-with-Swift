//: [Previous](@previous)

import Foundation
import Combine
example(of: "drop(while:)") {
  var subscriptions = Set<AnyCancellable>()
  let numbers = (1...10).publisher
  numbers
    .drop(while: { $0 % 5 != 0 })
    .sink( receiveCompletion: { print("Completed with: \($0)")},
    receiveValue: { print($0) })
    .store(in: &subscriptions)
}
