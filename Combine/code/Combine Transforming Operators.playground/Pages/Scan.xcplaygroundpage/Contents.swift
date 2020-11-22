//: [Previous](@previous)

import Foundation
import Combine

example(of: "scan") {
  var subscriptions = Set<AnyCancellable>()
  var dailyGainLoss: Int { .random(in: -10...10)}
  let august2019 = (0..<5)
    .map { _ in dailyGainLoss}
  
  print(august2019)
  
  let august2019Publisher = august2019.publisher
  
  august2019Publisher
    .scan(50) { latest, current in
      max(0, latest + current)
    }
    .sink(receiveValue: { print($0) })
    .store(in: &subscriptions)
}
