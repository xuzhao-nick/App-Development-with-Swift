//: [Previous](@previous)

import Foundation
import Combine

example(of: "append(Sequence)") {
  let publisher = [1, 2, 3].publisher
  var subscriptions = Set<AnyCancellable>()
  publisher
    .append([4, 5])
    .append(Set([6, 7]))
    .append(stride(from: 8, to: 11, by: 2))
    .sink(receiveValue: { print($0) })
    .store(in:&subscriptions)
}
