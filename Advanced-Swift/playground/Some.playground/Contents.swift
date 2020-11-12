//https://www.vadimbulavin.com/opaque-return-types-and-the-some-keyword-in-swift/

//Opaque type can be thought of as “a concrete type that implements this protocol”. Opaque type is denoted with `some Protocol` in function’s interface

func makeA() -> some Equatable { "A" }

let a = makeA()
print(a)
let anotherA = makeA()
print(anotherA)
print(a == anotherA)

//Opaque Types and Protocols

// Following code will cause error:
// error: protocol 'Equatable' can only be used as a generic constraint because it has Self or associated type requirements

//func makeB() -> Equatable { "B" }

//But with `some`, it can work
func makeB() -> some Equatable { "B" }

//A function can return different protocol types, but cannot return same opaque type.

protocol P {}

extension Int: P {}
extension String: P {}

func makeIntOrString(_ isInt: Bool) -> P {isInt ? 1 : "1" }

//Compiler error
/*
func makeIntOrStringOpaque(_ isInt: Bool) -> some P {
  isInt ? 1 : "1"
}
 */

/// Adds one to any decimal type
func addOne<Value: FloatingPoint>(_ x: Value) -> some FloatingPoint {
    x + 1
}

// Variables will be assigned 'some FloatingPoint' type
let double = addOne(Double.pi) // 4.141592653589793
let float = addOne(Float.pi) // 4.141593

// Still get all of the required attributes/functions by the FloatingPoint protocol
//func squareRoot() -> some FloatingPoint
let doubleValue: Double = 3.5
let floatValue: Float = 4.3
doubleValue.squareRoot()
floatValue.squareRoot() 

// Be careful, however, not to combine 2 'some FloatingPoint' variables
double + double // OK
//double + float // error
