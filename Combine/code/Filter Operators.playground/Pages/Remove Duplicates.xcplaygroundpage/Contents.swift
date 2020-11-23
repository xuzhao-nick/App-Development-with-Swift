//: [Previous](@previous)

import Foundation
import Combine

example(of: "removeDuplicates") {
  var subscriptions = Set<AnyCancellable>()
  let words = "hey hey there! want to listen to mister mister ?"
    .components(separatedBy: " ")
    .publisher
  
  words
    .removeDuplicates()
    .sink { print($0) }
    .store(in: &subscriptions)
}

