/*Defining a Scheduler
Scheduler is the synchronization mechanism of the Combine framework, which defines the context for where and when the work is performed.

Combine does not work directly with threads. Instead, it allows Publishers to operate on specific Schedulers.
 */

import Foundation
import Combine
let subject = PassthroughSubject<Int, Never>()
let token = subject.sink(receiveValue: { value in
  print(Thread.isMainThread)
})

subject.send(1)

DispatchQueue.global().async {
  subject.send(2)
}
