import UIKit
//Serial Queue

let serialQueue = DispatchQueue(label:"serial")
let concurrentQueue = DispatchQueue(label: "concurrent",attributes: .concurrent)

type(of: serialQueue)
type(of: concurrentQueue)

serialQueue.async {
  for i in 1..<5 {
    print("serial queue: \(i)")
  }
}

concurrentQueue.async {
  for i in 5...10 {
    print("concurrent queue: \(i)")
  }
}
