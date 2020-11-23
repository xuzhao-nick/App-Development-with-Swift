//: [Previous](@previous)

import Foundation
import Combine

/*
 Create an example that publishes a collection of numbers from 1 through 100, and use filtering operators to:

 Skip the first 50 values emitted by the upstream publisher.
 Take the next 20 values after those first 50 values.
 Only take even numbers.
 The output of your example should produce the following numbers, one per line:

 52 54 56 58 60 62 64 66 68 70
 */
example(of: "challenge") {
  var subscriptions = Set<AnyCancellable>()
  let numbers = (1...100).publisher
  numbers
    .dropFirst(50)
    .prefix(20)
    .filter{ $0 % 2 == 0 }
    .sink( receiveCompletion: { print("Completed with: \($0)")},
    receiveValue: { print($0) })
    .store(in: &subscriptions)
}
