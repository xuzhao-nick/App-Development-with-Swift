//: [Previous](@previous)

import Foundation
import Combine

example(of: "compactMap") {
  var subscriptions = Set<AnyCancellable>()
  let strings = ["a", "1.24", "3", "def", "45", "0.23"].publisher
  
  strings
    .compactMap { Float($0) }
    .sink{
      print($0)
    }
    .store(in:&subscriptions)
}
