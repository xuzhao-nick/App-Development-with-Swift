
import Foundation

protocol Distribution where Value : Numeric{
  associatedtype Value
  func sample<G>(using generator: inout G) -> Value where G: RandomNumberGenerator
  func sample<G>(count: Int, using generator: inout G) -> [Value] where G: RandomNumberGenerator
}

extension Distribution {
  func sample<G>(count: Int, using generator: inout G) -> [Value] where G: RandomNumberGenerator {
    var g = SystemRandomNumberGenerator()
    return (1...count).map { _ in sample(using: &g) }
  }
  
  func sample() -> Value {
    var g = SystemRandomNumberGenerator()
    return sample(using: &g)
  }
  
  func sample(count: Int) -> [Value] {
    var g = SystemRandomNumberGenerator()
    return sample(count: count, using: &g)
  }
}


struct BinomialDistribution: Distribution {
  private(set) var p: Double
  typealias Value = Int
  var q: Double {
    return 1 - p
  }
  init(p: Double) {
    precondition(p >= 0 && p <= 1, "p must be between 0 and 1")
    self.p = p
  }
  
  func sample<G>(using generator: inout G) -> Int where G: RandomNumberGenerator {
    return Double.random(in: 0...1, using: &generator) <= p ? 1 : 0
  }
}


let coin = BinomialDistribution(p:0.5)
coin.sample(count: 100)

extension Sequence where Element: Distribution {
  func sumOfSamples() -> Element.Value {
    return reduce(0) { $0 + $1.sample() }
  }
}
//////////////////////////////////////////////////////////////////////


let distros = [BinomialDistribution(p: 0.1),
               BinomialDistribution(p: 0.5),
               BinomialDistribution(p: 0.9)]

let sum = distros.sumOfSamples()
type(of: sum)


//////////////////////////////////////////////////////////////////////

struct UniformDistribution: Distribution {
  
  var range: Range<Int>
  init<R: RangeExpression>(range expr: R) where R.Bound == Int {
    range = expr.relative(to: Range<Int>(Int.min...Int.max - 1))
    
  }
  
  func sample<G: RandomNumberGenerator>(using generator: inout G) -> Int {
    return Int.random(in: range)
  }
}
//Closed range
UniformDistribution(range: 0...11).sample()
//Normal range
UniformDistribution(range: 0..<11).sample()
UniformDistribution(range: 100..<200).sample()
