import Foundation

struct Pair<Element> {
  var first: Element
  var second: Element
}

extension Pair {
  var flipped: Pair { return Pair(first: second, second: first) }
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

//bools cannot have "sorted" function, because it don't conform to Comparable
let bools = Pair(first: true, second: false)
//ints can have "sorted" function, because it conform to Comparable
let ints = Pair(first: 1000, second: 300)
ints.sorted()
ints.max()



extension Pair {
  func min(by areIncreasingOrder: (Element, Element) -> Bool) -> Element {
    return areIncreasingOrder(first, second) ? first : second
  }
  
  func max(by areIncreasingOrder: (Element, Element) -> Bool) -> Element {
    return !areIncreasingOrder(first, second) ? first : second
  }
  
  func sorted(by arIncreasingOrder: (Element, Element) -> Bool) -> Pair {
    return arIncreasingOrder(first, second) ? self : flipped
  }
}
//By implement `sorted by` function, the Element type which don't conform to Comparable still can be sorted.
let result = bools.sorted{ a, b in
  return a || b
}

print(result)
