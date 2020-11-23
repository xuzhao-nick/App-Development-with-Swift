//: [Previous](@previous)

import Foundation
import Combine
example(of: "drop(untilOutputFrom:)") {
  var subscriptions = Set<AnyCancellable>()
  let isReady = PassthroughSubject<Void, Never>()
  let taps = PassthroughSubject<Int, Never>()
  
  taps
    .drop(untilOutputFrom: isReady)
    .sink{ print($0) }
    .store(in: &subscriptions)
  
  (1...5).forEach { n in
    taps.send(n)
    if n == 3 {
      isReady.send()
    }
  }
}
