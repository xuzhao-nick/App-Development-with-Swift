//: [Previous](@previous)

import Foundation
import Combine

example(of: "replaceEmpty(with:)") {
  var subscriptions = Set<AnyCancellable>()
  let empty = Empty<Int, Never>()
  empty
    .replaceEmpty(with: 1)
    .sink(receiveCompletion: { print($0) },
          receiveValue: { print($0) })
    .store(in: &subscriptions)
}
