//: [Previous](@previous)

import Foundation
import Combine
import UIKit
var subscriptions = Set<AnyCancellable>()
example(of: "switchToLatest - Network Request") {
  
  let url = URL(string: "https://source.unsplash.com/random")!
  func getImage() -> AnyPublisher<UIImage?, Never> {
    URLSession.shared
      .dataTaskPublisher(for: url)
      .map { data, _ in UIImage(data: data) }
      .print("image")
      .replaceError(with: nil)
      .eraseToAnyPublisher()
  }
  
  let taps = PassthroughSubject<Void, Never>()
  
  taps
    .map{_ in getImage()}
    .switchToLatest()
    .sink(receiveValue: { _ in })
    .store(in: &subscriptions)
  
  print("tap")
  taps.send()
  
  DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
    print("tap")
    taps.send()
  }
  
  DispatchQueue.main.asyncAfter(deadline: .now() + 3.1) {
    print("tap")
    taps.send()
  }
}
