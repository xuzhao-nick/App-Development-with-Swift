//: [Previous](@previous)

import Foundation

enum FancyError: Error {
  case kazam(String)
}

enum PlainError: Int, Error {
  case boom = 100
  case bam
}

print("Example 1")


do {
  throw PlainError.bam
}
catch (let error as NSError) {
  dump(error)
}

print("Example 2")


do {
  throw FancyError.kazam("Hello")
}
catch (let error as NSError) {
  dump(error)
}

do {
  let file = try FileHandle(forReadingFrom: URL(fileURLWithPath:"sdf"))
  print(file)
}
catch (let error as NSError) {
  dump(error)
}
