//: [Previous](@previous)

import UIKit

let inactiveQueue = DispatchQueue(label: "concurrent", attributes: [.initiallyInactive, .concurrent])

inactiveQueue.async {
  print("Done")
}

print("Not yet done")
inactiveQueue.activate()
print("Now its done")
