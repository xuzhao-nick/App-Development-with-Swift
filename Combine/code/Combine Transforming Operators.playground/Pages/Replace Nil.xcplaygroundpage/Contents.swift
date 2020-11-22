//: [Previous](@previous)

import Foundation
import Combine

example(of: "replaceNil") {
  var subscriptions = Set<AnyCancellable>()
  ["A", nil, "C"].publisher
    .eraseToAnyPublisher()
    .replaceNil(with:"-")
    .sink(receiveValue: { print($0)})
    .store(in: &subscriptions)
}
