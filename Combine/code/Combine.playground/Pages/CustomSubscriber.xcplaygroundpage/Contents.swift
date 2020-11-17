 import Foundation
 import Combine
 
 example(of: "Custom Subscriber") {
  //let publisher = (1...6).publisher
  //let publisher = ["A","B"].publisher
  let publisher = [1,3,4,7,8].publisher
  final class IntSubscriber: Subscriber {
    typealias Input = Int
    typealias Failure = Never
    func receive(subscription: Subscription) {
      subscription.request(.max(3))
    }
    
    func receive(_ input: Int) -> Subscribers.Demand {
      print("Received value", input)
      //return .unlimited
      return .none
      //return .max(1)
    }
    
    func receive(completion: Subscribers.Completion<Never>) {
      print("Received completion", completion)
    }
  }
  
  let subscriber = IntSubscriber()
  
  publisher.subscribe(subscriber)
 }
 
 
 example(of: "Generic Custom Subscriber") {
  //let publisher = (1...6).publisher
  //let publisher = ["A","B"].publisher
  let publisher = [1,3,4,7,8].publisher
  let stringPublisher = ["Abc","Def", "Opq", "Rst", "Uvw"].publisher
  final class GSubscriber<T>: Subscriber {
    typealias Input = T
    typealias Failure = Never
    
    func receive(_ input: T) -> Subscribers.Demand {
      print("Generic Subscriber received value", input)
      return .none
    }
    
    func receive(subscription: Subscription) {
      subscription.request(.unlimited)
    }
    
    func receive(completion: Subscribers.Completion<Never>) {
      print("Generic Subscriber received completion", completion)
    }
  }
  
  let intSubscriber = GSubscriber<Int>()
  
  publisher.subscribe(intSubscriber)
  
  let stringSubscriber = GSubscriber<String>()
  stringPublisher.subscribe(stringSubscriber)
 }
 
