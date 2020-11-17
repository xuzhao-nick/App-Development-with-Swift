//: [Previous](@previous)

import Foundation
import Combine

example(of: "assign(to:on:)") {
  class SomeObject {
    var value: String = "" {
      didSet {
        print("set value: ", value)
      }
    }
  }
  
  let object = SomeObject()
  
  let publisher = ["Hello", "World!"].publisher
  
  _ = publisher.assign(to:\.value, on:object)
  print("object.value =",object.value)
}



example(of: "republish assign(to:)") {
  class SomeObject {
    @Published var value = 0
  }
  
  let object = SomeObject()
  
  object.$value
    .sink {
      print("republish: ", $0)
    }
  
  
  //(0..<10).publisher
  // .assign(to: \.value, on: object)
  //Or
  (0..<10).publisher
    .assign(to:&object.$value)
}
