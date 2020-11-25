//: [Previous](@previous)

import Foundation
import Combine

let valuesPerSecond = 1.0
let delayInSeconds = 1.5

let sourcePublisher = PassthroughSubject<Date, Never>()

let delayedPublisher = sourcePublisher.delay(for: .seconds(delayInSeconds), scheduler: DispatchQueue.main)

let subscription = Timer.publish(every: 1.0 / valuesPerSecond, on: .main, in: .common)
  .autoconnect()
  .subscribe(sourcePublisher)

//sourcePublisher.sink(receiveValue: {print($0)})
