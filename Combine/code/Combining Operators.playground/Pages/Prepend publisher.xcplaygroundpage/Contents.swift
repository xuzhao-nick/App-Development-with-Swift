//: [Previous](@previous)

import Foundation
import Combine

example(of: "prepend(Publisher)") {
  let publisher1 = [3, 4].publisher
  let publisher2 = [1, 2].publisher
  var subscriptions = Set<AnyCancellable>()
  publisher1
    .prepend(publisher2)
    .sink(receiveValue: { print($0)})
    .store(in: &subscriptions)
}
