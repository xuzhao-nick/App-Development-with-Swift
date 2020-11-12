//sample of phantom type
struct User {
  let id: Tag<UserID>
  let age: Tag<Age>
}

enum UserID {}
enum Age {}

struct Tag<Type>: Equatable, ExpressibleByIntegerLiteral {
  init(integerLiteral value: IntegerLiteralType) {
    self.value = value
  }
  
  var value: Int
}

let user = User(id: 53, age: 53)
//print(user.id == user.age)  //This will produce error

//Another sample of Phantom type

struct Named<T>: Hashable, ExpressibleByStringLiteral {
  var name: String
  init(_ name: String) {
    self.name = name
  }
  init(stringLiteral value: String) {
    name = value
  }
  var description: String {
    return name
  }
}

enum StateTag {}
enum CapitalTag {}

typealias State  = Named<StateTag>
typealias Capital = Named<StateTag>

var lookup: [State: Capital] = ["Alabama": "Montgomery",
                                "Alaska":  "Juneau",
                                "Arizona": "Phoenix"]

func printStateAndCapital(_ state: State, _ capital: Capital) {
  print("The capital of \(state.name) is \(capital.name).")
}

func test() {
  
  let alaska = State("Alaska")
  
  guard let capital = lookup[alaska] else {
    return
  }
  printStateAndCapital(alaska, capital)
}

test()



