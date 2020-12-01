//: [Previous](@previous)

import Foundation
import Combine

let newSubject = PassthroughSubject<Int, Never>()
let test = newSubject.sink { (value) in
  print(Thread.isMainThread)
}

newSubject.send(1)

DispatchQueue.global().async {
  newSubject.send(2)
}
