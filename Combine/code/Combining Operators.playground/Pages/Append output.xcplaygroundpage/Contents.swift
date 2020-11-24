//: [Previous](@previous)

import Foundation
import Combine

example(of: "append(Output...") {
  let publisher = [1].publisher
  var subscriptions = Set<AnyCancellable>()
  publisher
    .append(2, 3)
    .append(4)
    .sink(receiveValue: { print($0) })
    .store(in: &subscriptions)
}
