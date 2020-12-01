//: [Previous](@previous)

import Foundation

let queueTwo = DispatchQueue(label: "com.nickxu.app")
let timeDelay = DispatchTime.now() + 3.0

queueTwo.asyncAfter(deadline: timeDelay) {
  print("GCD")
}
