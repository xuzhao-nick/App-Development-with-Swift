//: [Previous](@previous)

import Foundation

class MyClass: NSObject {
  var recursiveLock = NSRecursiveLock()
  
  func safeMethod() {
    recursiveLock.lock()
    //someFumction()
    recursiveLock.unlock()
  }
  
  func someFunction() {
    recursiveLock.lock()
    //run thread safe code
    recursiveLock.unlock()
  }
}


var test = MyClass()
test.safeMethod()
test.someFunction()
