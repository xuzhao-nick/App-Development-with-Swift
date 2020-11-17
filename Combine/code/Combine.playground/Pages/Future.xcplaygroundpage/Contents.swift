//: [Previous](@previous)

import Foundation
import Combine

var subscriptions = Set<AnyCancellable>()

example(of: "Future") {
  func futureIncrement (
    integer: Int,
    afterDelay delay: TimeInterval) -> Future<Int, Never> {
    return Future<Int, Never> { promise in
      print("Original")
      DispatchQueue.global().asyncAfter(deadline: .now() + delay) {
        promise(.success(integer + 1))
      }
    }
  }
  let future = futureIncrement(integer: 1, afterDelay: 3)
  
  future
    .sink(receiveCompletion: {print($0)},
      receiveValue: {print($0)})
    .store(in: &subscriptions)
  
  future
    .sink(receiveCompletion: { print("Second", $0) },
          receiveValue: { print("Second", $0) })
    .store(in: &subscriptions)
}
