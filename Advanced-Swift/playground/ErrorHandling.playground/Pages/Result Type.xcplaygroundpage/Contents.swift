//: [Previous](@previous)

import Foundation


enum Result<Success, Failure: Error> {
  case success(Success)
  case failure(Failure)
  
  func get() throws -> Success {
    switch self {
    case .success(let success):
      return success
    case .failure(let failure):
      throw failure
    }
  }
  
  func map<NewSuccess>(_ transform: (Success) -> NewSuccess) -> Result<NewSuccess, Failure> {
    switch self {
    case .success(let success):
      return .success(transform(success))
    case .failure(let failure):
      return .failure(failure)
    }
  }
  
  func flatMap<NewSuccess>(_ transform: (Success) -> Result<NewSuccess, Failure>) -> Result<NewSuccess, Failure> {
    switch self {
    case .success(let success):
      return transform(success)
    case .failure(let failure):
      return .failure(failure)
    }

  }
}

enum MathError: Error {
  case divisionByZero
}

func divide(_ a: Double, _ b: Double)  -> Result<Double, MathError> {
  guard b != 0 else {
    return .failure(MathError.divisionByZero)
  }
  return .success(a/b)
}

divide(10, 0)
divide(10, 2)

do {
  let answer = try divide(10, 0).get()
  print(answer)
}
catch {
  dump(error)
}

do {
  let result = try divide(144, 12).map{ divide($0, 12) }.get().get()
  print(result)
} catch {
  print(error)
}


do {
  let result = try divide(144, 12).flatMap{ divide($0, 5) }.get()
  print(result)
} catch {
  print(error)
}
