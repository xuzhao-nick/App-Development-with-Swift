import Foundation
import Combine
var subscriptions = Set<AnyCancellable>()
let start = Date()
let delayInSeconds = 1.5
let sourcePublisher = Timer.publish(every: 1.0, on: .main, in: .common)
  .autoconnect()
  
sourcePublisher
  .delay(for: .seconds(delayInSeconds), scheduler: DispatchQueue.main)
  .map({ output in
      return output.timeIntervalSince(start)
  })
  .map({ timerInterval in
    return Int(timerInterval)
  })
  .sink{ seconds in
    print("Seconds: \(seconds)")
  }
  .store(in: &subscriptions)

//let delayedPublisher = sourcePublisher.delay(for: .seconds(delayInSeconds), scheduler: DispatchQueue.main)
//
//delayedPublisher.sink{ seconds in
//  print("Delayed: \(seconds)")
//}
