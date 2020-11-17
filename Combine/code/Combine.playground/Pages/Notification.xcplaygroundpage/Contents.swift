//: [Previous](@previous)
import Foundation
import Combine


// A traditional way of notification

 let center = NotificationCenter.default
 let theNotification = Notification.Name("The notification")
 let observer = center.addObserver(forName: theNotification, object: nil, queue: nil){ notification in
 print("Notification received!")
 }
 
center.post(name: theNotification, object: nil)

center.removeObserver(observer)


//Combine way of notification


 
 example(of: "Publisher", action: {
 let myNotification = Notification.Name("New notification")
 let publisher = NotificationCenter.default.publisher(for: myNotification, object: nil)
 
 let subscription = publisher.sink { _ in
 print("Notification received from a publisher!")
 }
 let subscription1 = publisher.sink{ _ in
 print("Another notification received from same publisher")
 }
 
 
 let center = NotificationCenter.default
 center.post(name: myNotification, object: nil)
 subscription.cancel()
 subscription1.cancel()
 
 
 })
