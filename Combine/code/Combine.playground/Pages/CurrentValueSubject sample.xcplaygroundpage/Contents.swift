//: [Previous](@previous)

import Foundation
import Combine

let anotherSubject = CurrentValueSubject<String, Never>("I am a...")
let anotherSubjectSubscription = anotherSubject
  .sink{ print($0) }

anotherSubject.send("Subject")
