//: [Previous](@previous)

import Foundation

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
