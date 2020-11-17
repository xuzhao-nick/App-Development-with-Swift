//: [Previous](@previous)

import Foundation
import Combine

example(of: "PassthroughSubject") {
  enum MyError: Error {
    case test
  }
  
  final class StringSubscriber: Subscriber {
    typealias Input = String
    typealias Failure = MyError
    
    func receive(_ input: String) -> Subscribers.Demand {
      print("Received value", input)
      return input == "World" ? .max(1) : .none
    }
    
    func receive(completion: Subscribers.Completion<MyError>) {
      print("Received completion", completion)
    }
    
    
    func receive(subscription: Subscription) {
      subscription.request(.max(2))
    }
    
  }
  
  let subscriber = StringSubscriber()
  
  let subject = PassthroughSubject<String, MyError>()
  subject.subscribe(subscriber)
  
  let subscription = subject
    .sink { completion in
      print("Received completion (sink)", completion)
    } receiveValue: { value in
      print("Received value (sink)", value)
    }
  subject.send("Hello")
  subscription.cancel()
  //subject.send(completion: .failure(MyError.test))
  subject.send("World")
  print("Canceled")
  subscription.cancel()
  subject.send("hahaha")
  subject.send("what if")
  subject.send(completion: .finished)
  subject.send(completion: .failure(MyError.test))
  subject.send("Still there!")

}
