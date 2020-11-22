# Error handling

### [ErrorHandling sample](../playground/ErrorHandling.playground)

#### Use precondition and StaticString to prevent error

  precondition function: Use this function to detect conditions that must prevent the program from proceeding, even in shipping code.

```
struct Email {

  init?(raw: String) {
    guard Email.isValid(raw) else {
      return nil
    }
    self.address = raw
  }
  
  init(_ address: StaticString) {
    let checked = String(describing: address)
    precondition(Email.isValid(checked), "invalid email")
    self.address = checked
  }
  
  // Is valid regex by https://stackoverflow.com/a/26503188/591884
  static func isValid(_ input: String) -> Bool {

    // Why is try! okay here?
    let regex = try! NSRegularExpression(pattern: "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$", options: .caseInsensitive)

    return regex.firstMatch(in: input, options: [], range:
      NSRange(location: 0, length: input.count)) != nil
  }
  
  var address: String
}

let name = "lsdjf"

Email(raw:name)
Email("ray@email.com")
//Email(name) //compile error
```

#### Try/Catch handle error

```
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
```

#### Rethrows

- Rethrows is a method that accepts both parameter types (throwing and non throwing),
- When use regular function as parameter, no need to "try". 


```
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

```

#### Define Simple error

```
enum PlainError: Int, Error {
  case boom = 100
  case bam
}

do {
  throw PlainError.bam
}
catch {
  print("Default match", error)
}

```

#### Define error with message and multiple error catching

```
enum FancyError: Error {
  case kazam(String)
}

enum PlainError: Int, Error {
  case boom = 100
  case bam
}

do {
  throw FancyError.kazam("with a message")
}
catch (let error as PlainError) {
  print("Basic!", error)
}
catch FancyError.kazam(let message) {
  print("Fancy", message)
}
catch {
  print(error)
}
```

#### Convert error to NSError

```
enum FancyError: Error {
  case kazam(String)
}

do {
  throw FancyError.kazam("Hello")
}
catch (let error as NSError) {
  dump(error)
}
```

#### Catching a real NSError

```
do {
  let file = try FileHandle(forReadingFrom: URL(fileURLWithPath:"sdf"))
  print(file)
}
catch (let error as NSError) {
  dump(error)
}

```