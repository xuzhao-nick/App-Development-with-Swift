//: [Previous](@previous)

import Foundation
import Combine

example(of: "map key paths") {
  var subscriptions = Set<AnyCancellable>()
  let publisher = PassthroughSubject<Coordinate, Never>()
  
  publisher
    .map(\.x, \.y)
    .sink(receiveValue: { x, y in
      print("The coodinate at (\(x), \(y)) is in quadrant",
            quadrantOf(x: x, y: y)
      )
      
    })
    .store(in: &subscriptions)
  publisher.send(Coordinate(x: 10, y: -8))
  publisher.send(Coordinate(x: 0, y: 5))
    }
