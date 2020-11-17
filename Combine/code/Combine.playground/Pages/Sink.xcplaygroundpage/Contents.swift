import Foundation
import Combine


 example(of: "Just") {
 let just = Just("Hello world!")
 
 _ = just.sink(receiveCompletion: {
 print("Received completion:", $0)
 }, receiveValue: {
 print("Received value:", $0)
 })
 
 _ = just
 .sink(
 receiveCompletion: {
 print("Received completion (another)", $0)
 },
 receiveValue: {
 print("Received value (another)", $0)
 })
 }
 



 




