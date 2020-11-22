import Foundation


enum MathError: Error {
  case divisionByZero
}

func divide(_ numerator: Double, _ denominator: Double) throws -> Double {
  if abs(denominator) < Double.ulpOfOne {
    throw MathError.divisionByZero
  }
  return numerator / denominator
}

do {
  print(try divide(10, 0))
}
catch {
  dump(error)
}


////////////////////////////////////////////////////////////////////////////

let isWeekend = true
let value = isWeekend ? 10 : 0

@inlinable
public func ifelse<T>(_ test: Bool,
                      _ a: @autoclosure () throws -> T,
                      _ b: @autoclosure () throws  ->T) rethrows -> T {
  
  return test ? try a() : try b()
}

func expensive()  throws -> String {
  print("I am very expensive")
  return "Boo"
}

let value1 = try? ifelse(isWeekend, "Yay", try expensive())
let value2 = ifelse(isWeekend, "Yay", "Boo")

extension String : Error {}

func authenticateBiometrically(_ user: String) throws -> Bool {
  throw "Failed"
}

func authenticateByPassword(_ user: String) -> Bool {
  return true
}


func authenticateUser(method: (String) throws -> Bool) rethrows {
  try method("two straws")
  print("Success!")
}
//After use "rethrow", we can call "authenticateUser" with or without "try"
authenticateUser(method: authenticateByPassword)

do {
  try authenticateUser(method: authenticateBiometrically)
} catch {
  print("D'oh!")
}
