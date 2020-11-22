//: [Previous](@previous)

import Foundation
import Combine

example(of: "map") {
  var subscriptions = Set<AnyCancellable>()
  let formatter = NumberFormatter()
  formatter.numberStyle = .spellOut
  
  [123, 4, 56].publisher
    .map{
      formatter.string(for: NSNumber(integerLiteral: $0)) ?? ""
    }
    .sink(receiveValue: {print($0)})
    .store(in: &subscriptions)
}
