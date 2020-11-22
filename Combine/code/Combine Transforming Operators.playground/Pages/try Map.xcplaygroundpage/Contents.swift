//: [Previous](@previous)

import Foundation
import Combine

example(of: "tryMap") {
  var subscriptions = Set<AnyCancellable>()
  Just("Directory name that does not exist")
    .tryMap { try FileManager.default.contentsOfDirectory(atPath: $0)}
    .sink(receiveCompletion: { print($0)},
          receiveValue: { print($0) } )
    .store(in: &subscriptions)
}
