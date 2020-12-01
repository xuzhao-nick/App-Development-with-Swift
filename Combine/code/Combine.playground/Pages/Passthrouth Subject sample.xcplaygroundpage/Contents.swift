//: [Previous](@previous)

import Foundation
import Combine

let subject = PassthroughSubject<Int, Never>()
let subscription = subject
  .sink{ print("PassthroughSubject: \($0)") }

subject.send(94)

//Connect subject to a publisher, and publish the value `29`

Just(29)
  .subscribe(subject)

