//: [Previous](@previous)
import Foundation
import Combine

example(of: "prepend(Sequence)") {
  let publisher = [5, 6, 7].publisher
  var subscriptions = Set<AnyCancellable>()
  publisher
    .prepend([3,4])
    .prepend(Set(1...2))
    .prepend(stride(from: 6, to: 11, by: 2))
    .sink{ print($0) }
    .store(in: &subscriptions)
}
