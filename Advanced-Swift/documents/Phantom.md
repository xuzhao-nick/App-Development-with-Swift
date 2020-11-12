# Phantom type

- [Phantom.playground](../playground/Phantom.playground)
- [AnotherPhantom.playground](../playground/AnotherPhantom.playground)

- The basic definition of a phantom type is: a type that doesn’t use at least one of its generic type parameters. 
- Phantom types are a powerful way to give the Swift compiler extra information about our code so that it can stop us from making mistakes and validate different variants of a given value. 
- While using phantom types usually makes an API more verbose, and does come with the added complexity of generics, but it can let us reduce our reliance on run-time checks, and let the compiler perform those checks instead.

Sample Code:
```
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
//This line will produce error, although both user.id and user.age have same generic data type inside.
print(user.id == user.age)  
```




