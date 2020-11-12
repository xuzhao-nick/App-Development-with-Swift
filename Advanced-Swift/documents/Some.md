# Opaque type and 'some' keyword

- [Some.playground](../playground/Some.playground)

- <b>Opaque type</b> can be thought of as `a concrete type that implements this protocol, but doesn't expose the exact type before compile time`. 
- <b>Opaque type</b> is denoted with `some Protocol` in function’s interface
- If a function with an opaque return type returns from multiple places, all of the possible return values must have the same type.

For example, following code will have compiler issue: `Protocol 'FloatingPoint' can only be used as a generic constraint because it has Self or associated type requirements`

```
func addOne<Value: FloatingPoint>(_ x: Value) -> FloatingPoint {
    x + 1
}
```

But after add `some` keyword, it will work:
```
func addOne<Value: FloatingPoint>(_ x: Value) -> some FloatingPoint {
    x + 1
}
// Variables will be assigned 'some FloatingPoint' type
let double = addOne(Double.pi) // 4.141592653589793
let float = addOne(Float.pi) // 4.141593
```
Similar to system functions:
```
//func squareRoot() -> some FloatingPoint
let doubleValue: Double = 3.5
let floatValue: Float = 4.3
doubleValue.squareRoot()
floatValue.squareRoot() 
```

## Opaque Types and Protocols

- [MoreSomeSample.playground](../playground/MoreSomeSample.playground)

- Generally speaking, protocol types give you more flexibility about the underlying types of the values they store, and opaque types let you make stronger guarantees about those underlying types.

- As the following sample, the less specific return type information from protoFlip( ) means that many operations that depend on type information aren’t available on the returned value.

- Using a protocol type as the return type for a function gives you the flexibility to return any type that conforms to the protocol. However, the cost of that flexibility is that some operations aren’t possible on the returned values. The example shows how the == operator isn’t available—it depends on specific type information that isn’t preserved by using a protocol type.

- Protocol with associated types can't be used as a return type.

```
protocol Shape {
  func draw() -> String
}

struct Triangle: Shape {
  var size: Int
  func draw() -> String {
    var result = [String]()
    for length in 1...size {
      result.append(String(repeating: "*", count: length))
    }
    return result.joined(separator: "\n")
  }
}

struct FlippedShape<T: Shape>: Shape {
  var shape: T
  func draw() -> String {
    let lines = shape.draw().split(separator: "\n")
    return lines.reversed().joined(separator: "\n")
  }
}

 struct Square: Shape {
    var size: Int
    func draw() -> String {
        let line = String(repeating: "*", count: size)
        let result = Array<String>(repeating: line, count: size)
        return result.joined(separator: "\n")
    }
}

func makeTrapezoid() -> some Shape {
    let top = Triangle(size: 2)
    let middle = Square(size: 2)
    let bottom = FlippedShape(shape: top)
    let trapezoid = JoinedShape(
        top: top,
        bottom: JoinedShape(top: middle, bottom: bottom)
    )
    return trapezoid
}

func flip<T: Shape>(_ shape: T) -> some Shape {
  return FlippedShape(shape: shape)
}


func protoFlip<T: Shape>(_ shape: T) -> Shape {
    if shape is Square {
        return shape
    }

    return FlippedShape(shape: shape)
}

```



