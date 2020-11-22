//: [Operators](@previous)
import Combine
import Foundation

example(of: "collect") {
  let input = PassthroughSubject<String, Never>()
  var subscriptions = Set<AnyCancellable>()

 input
    .collect(5)
    .sink(receiveCompletion: {print($0)},
          receiveValue: {print($0)})
    .store(in: &subscriptions)
  
  ["A","B","C","D","E"].forEach { (item) in
    print("item:",item)
    input.send(item)
  }

}
