//: [Previous](@previous)

import Foundation
import Combine

example(of: "Type erasure") {
  var subscriptions = Set<AnyCancellable>()
  let subject = PassthroughSubject<Int, Never>()
  
  let publisher = subject.eraseToAnyPublisher()
  
  publisher
    .sink(receiveValue: {print($0)})
    .store(in: &subscriptions)
  
  subject.send(0)

}
