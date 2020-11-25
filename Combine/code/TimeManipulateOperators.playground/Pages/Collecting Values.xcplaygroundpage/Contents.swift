//: [Previous](@previous)

import Foundation
import Combine

let valuesPerSecond = 1.0
let collectTimeStride = 4

let sourcePublisher = PassthroughSubject<Date, Never>()

let collectedPublisher = sourcePublisher.collect(.byTime(DispatchQueue.main, .seconds(collectTimeStride)))


