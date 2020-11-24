//: [Previous](@previous)

import Foundation
import Combine

example(of: "append(Output...) #2") {
  let publisher = PassthroughSubject<Int, Never>()
  var subscriptions = Set<AnyCancellable>()
  
  publisher
    .print("append")
    .append(3, 4)
    .append(5)
    .sink(receiveCompletion: {
    print("Received completion:", $0)
    }, receiveValue: {
    print("Received value:", $0)
    })
    .store(in: &subscriptions)
  
  publisher.send(1)
  publisher.send(2)
  publisher.send(completion: .finished)
}
