//: [Previous](@previous)

import Foundation
import Combine

let _ = Just("A data stream")
  .sink { (value) in
    print("value is \(value)")
  }

// Connect subject to a publisher, and publish the value `29`
let subject = PassthroughSubject<Int, Never>()
Just(29)
  .subscribe(subject)

//A simple use of Future, in a function
enum FutureError: Error {
  case notMultiple
}


let future = Future<String, FutureError> { promise in
  let calendar = C
}
