//: [Previous](@previous)

import Foundation

let queueOne = DispatchQueue(label: "queueOne")
let queueTwo = DispatchQueue(label: "queueTwo")
let queueThree = DispatchQueue(label: "queueThree")


queueOne.sync {
  print(queueOne.label)
}

queueTwo.sync {
  print(queueTwo.label)
}

queueThree.sync {
  print(queueThree.label)
}
