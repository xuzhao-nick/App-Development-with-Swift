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

let smallTriangle = Triangle(size: 3)
print(smallTriangle.draw())
// *
// **
// ***

struct FlippedShape<T: Shape>: Shape {
  var shape: T
  func draw() -> String {
    let lines = shape.draw().split(separator: "\n")
    return lines.reversed().joined(separator: "\n")
  }
}

let flippedTriangle = FlippedShape(shape: smallTriangle)
print(flippedTriangle.draw())
// ***
// **
// *

struct JoinedShape<T: Shape, U: Shape>: Shape {
  var top: T
  var bottom: U
  func draw() -> String {
    return top.draw() + "\n" + bottom.draw()
  }
}

//When define joinedTriangles, it should know the detail of shape be composed.
let joinedTriangles = JoinedShape(top: smallTriangle, bottom: flippedTriangle)

print(joinedTriangles.draw())

struct Square: Shape {
    var size: Int
    func draw() -> String {
        let line = String(repeating: "*", count: size)
        let result = Array<String>(repeating: line, count: size)
        return result.joined(separator: "\n")
    }
}
/*
 The makeTrapezoid() function in this example declares its return type as some Shape; as a result, the function returns a value of some given type that conforms to the Shape protocol, without specifying any particular concrete type. Writing makeTrapezoid() this way lets it express the fundamental aspect of its public interface—the value it returns is a shape—without making the specific types that the shape is made from a part of its public interface.
 */
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

let trapezoid = makeTrapezoid()
print(trapezoid.draw())

func flip<T: Shape>(_ shape: T) -> some Shape {
  return FlippedShape(shape: shape)
}

func join<T: Shape, U: Shape>(_ top: T, _ bottom: U) -> some Shape {
  JoinedShape(top: top, bottom: bottom)
}

let opaqueJoinedTriangles = join(smallTriangle, flip(smallTriangle))

print(opaqueJoinedTriangles.draw())

/*
 If a function with an opaque return type returns from multiple places, all of the possible return values must have the same type.
 Following is an invalid sample
 */
/*
func invalidFlip<T: Shape>(_ shape: T) -> some Shape {
  if shape is Square {
    return shape
  }
  return FlippedShape(shape: shape)
}
 */

/*
 Differences between Opaque Types and Protocol types
 
 1, Generally speaking, protocol types give you more flexibility about the underlying types of the values they store, and opaque types let you make stronger guarantees about those underlying types.
 2, As the following sample, the less specific return type information from protoFlip(_:) means that many operations that depend on type information aren’t available on the returned value.
 3, Using a protocol type as the return type for a function gives you the flexibility to return any type that conforms to the protocol. However, the cost of that flexibility is that some operations aren’t possible on the returned values. The example shows how the == operator isn’t available—it depends on specific type information that isn’t preserved by using a protocol type.
 */
func protoFlip<T: Shape>(_ shape: T) -> Shape {
    if shape is Square {
        return shape
    }

    return FlippedShape(shape: shape)
}

let protoFlippedTriangle = protoFlip(smallTriangle)
let sameThing = protoFlip(smallTriangle)
//protoFlippedTriangle == sameThing  // Error
/*
 4, Protocol with associated types can't be used as a return type.
 */
protocol Container {
    associatedtype Item
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}
extension Array: Container { }
//Following function may have Error
/*
func makeProtocolContainer<T>(item: T) -> Container {
    return [item]
}
 */
func makeOpaqueContainer<T>(item: T) -> some Container {
    return [item]
}
