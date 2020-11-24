//: [Previous](@previous)

import Foundation
import Combine

example(of: "append(Publisher)") {
  let publisher1 = [1, 2].publisher
  let publisher2 = [3, 4].publisher
  var subscriptions = Set<AnyCancellable>()
  publisher1
    .append(publisher2)
    .sink(receiveValue: { print($0) })
    .store(in:&subscriptions)
}
