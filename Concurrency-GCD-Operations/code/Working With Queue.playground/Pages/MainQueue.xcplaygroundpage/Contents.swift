//: [Previous](@previous)

import Foundation

//Main queue
//Global queue
//

//Update UI from main queue
DispatchQueue.main.async {
  //UI update
}

//DispatchQueue.main.sync will block main thread
//DispatchQueue.main.async will not block main thread
//Global Queue
//global(qos: DispatchQos.QoSClass)
//QoS: Communicate developer intent and classification of work
//QoS: Quality of service
//Types of QoS:
/*
 userInteractive
 userInitiated
 Default
 Utility
 Background(least priority)
 
 .userInteractive:
 DispatchQueue.global(qos: .userInteractive).async {}
 - Run on the main thread
 - Executed immeiately
 - Use it to update UI events
 
 
 .userInitiated
 - DispatchQueue.global(qos: .userInitiated).async {}
 - Second highest priority
 - Execute user initiated tasks
 - User is willing to wait for results
 
 ,default
 - DispatchQueue.global(qos: .default).async {}
 - Priotity lower than first two, higher than .utility or .background
 
 .utility
 - DispatchQueue.global(qos: .utility).async {}
 - User initialed, willing to wait for completion.
 - For example calling an API
 
 .background
 - DispatchQueue.global(qos: .background).async {}
 - least priority
 - use it when the task will take a very long time
 - task is ovlivious to the user.
 - For example: database maintaining...
 */

/*
 Custom Queue: serial queue or concurrent queue
 let serialQueue = DIspatchQUeue(label: "serial")
 
 Custom Queue:
 - Perform tasks in background
 - Track your tasks
 */
