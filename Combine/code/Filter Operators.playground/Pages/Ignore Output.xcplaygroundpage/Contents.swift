//: [Previous](@previous)

import Foundation
import Combine

example(of: "ignoreOutput") {
  var subscriptions = Set<AnyCancellable>()
  let numbers = (1...10_000).publisher
  numbers
    .ignoreOutput()
    .sink( receiveCompletion: { print("Completed with: \($0)")},
    receiveValue: { print($0) })
    .store(in: &subscriptions)
}
