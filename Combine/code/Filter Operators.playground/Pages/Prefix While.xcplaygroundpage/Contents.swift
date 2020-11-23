//: [Previous](@previous)

import Foundation
import Combine
example(of: "prefix(while:)") {
  var subscriptions = Set<AnyCancellable>()
  let numbers = [1, 2, 3, 2, 1].publisher
  numbers
    .print()
    .prefix(while: { $0 < 3 })
    .sink( receiveCompletion: { print("Completed with: \($0)")},
    receiveValue: { print($0) })
    .store(in: &subscriptions)
}
