//: [Previous](@previous)

import Foundation
import Combine

example(of: "CurrentValueSubject") {
  // 1
  var subscriptions = Set<AnyCancellable>()
  
  // 2
  let subject = CurrentValueSubject<Int, Never>(0)
  
  // 3
  subject
    .print()
    .sink(receiveValue: { print("first subscription: \($0)") })
    .store(in: &subscriptions) // 4
  
  subject.send(1)
  subject.send(2)
  
  print("current value: \(subject.value)")
  subject.value = 3
  print("after set value is 3, current value:\(subject.value)")
  
  subject
    .print()
    .sink(receiveValue: { print("Second subscription:", $0) })
    .store(in: &subscriptions)
  
  subject.send(completion: .finished)
}
