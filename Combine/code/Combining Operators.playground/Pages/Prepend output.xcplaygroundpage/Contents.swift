import Foundation
import Combine

example(of: "prepend(Output...)") {
  let publisher = [3, 4].publisher
  var subscriptions = Set<AnyCancellable>()
  publisher
    .prepend(1, 2)
    .prepend(-1, 0)
    .sink{ print($0) }
    .store(in: &subscriptions)
}
