# Generic type and Associated type

## Generic type

- [GenericAndGenericConstraints.playground](../playground/GenericAndGenericConstraints.playground)

Generic code enables you to write flexible, reusable functions and types that can work with any type, subject to requirements that you define.

```
struct Stack<Element> {
  private var storage: [Element] = []
  
  mutating func push(_ element: Element) {
    storage.append(element)
  }
  
  mutating func pop() -> Element? {
    return storage.popLast()
  }
  
  var top: Element? {
    return storage.last
  }
  
  var isEmpty: Bool {
    return top == nil
  }
}

var stack = Stack<Int>()
stack.push(20)
stack.push(21)
stack.pop()

```



## Generic and Generic Constraints

- [GenericAndGenericConstraints.playground](https://github.com/xuzhao-nick/Advanced-Swift/tree/main/playground/GenericAndGenericConstraints.playground)

Type constraints specify that a type parameter must inherit from a specific class, or conform to a particular protocol or protocol composition. Because of those constraints on generic type, certain operations are possible. 
For example, the following `+` operator can be applied only when generic type conform to  `Numeric` protocol.

```
func add<T: Numeric>(_ a: T, _ b: T) -> T {
  return a + b
}

```

## Associated Type

- [associated-types.playground](https://github.com/xuzhao-nick/Advanced-Swift/tree/main/playground/associated-types.playground)

When defining a protocol, associated type gives a placeholder name to a type that is used as part of the protocol. 
The actual type to use for that associated type isn’t specified until the protocol is adopted. 

```
protocol Pixel {
	associatedtype Channel
}

struct Gray8: Pixel {
	typealias Channel = UInt8
}
```

## Associated Type and its Constraints

- associatedtype-constraints.playground

Similar to Generic type with constraints

```
protocol Distribution where Value : Numeric{
  associatedtype Value
  func sample<G>(using generator: inout G) -> Value where G: RandomNumberGenerator
  func sample<G>(count: Int, using generator: inout G) -> [Value] where G: RandomNumberGenerator
}
```

## Conditional Conformance

- [ConditionalConformance.playground](https://github.com/xuzhao-nick/Advanced-Swift/tree/main/playground/ConditionalConformance.playground)

<b>Conditional Conformance</b> allow types to conform to a protocol only when certain conditions are met – hence “conditional conformance”.

```
import Foundation

struct Pair<Element> {
  var first: Element
  var second: Element
}

extension Pair {
  var flipped: Pair {
    return Pair(first: second, second: first)
  }
}

protocol Orderable {
  associatedtype Element
  func min() -> Element
  func max() -> Element
  func sorted() -> Self
}

extension Pair: Orderable where Element: Comparable {
  func min() -> Element {
    return first < second ? first : second
  }
  
  func max() -> Element {
    return first > second ? first : second
  }
  
  func sorted() -> Pair {
    return first < second ? self : flipped
  }
  
}

//bools cannot have "sorted" function, because Bool type don't conform to Comparable
let bools = Pair(first: true, second: false)
//ints can have "sorted" function, because Int type conform to Comparable
let ints = Pair(first: 1000, second: 300)
ints.sorted()
ints.max()

```

By implemented `sorted by` function, the Element type which don't conform to Comparable still can be sorted.

```
extension Pair {
  
  func sorted(by arIncreasingOrder: (Element, Element) -> Bool) -> Pair {
    return arIncreasingOrder(first, second) ? self : flipped
  }
}

let result = bools.sorted{ a, b in
  return a || b
}

print(result)
```