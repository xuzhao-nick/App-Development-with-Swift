//: [Previous](@previous)

import Foundation
//The sample is from: https://github.com/antitypical/Result
typealias JSONObject = [String: Any]

enum JSONError: Error {
    case noSuchKey(String)
    case typeMismatch
}

func stringForKey(json: JSONObject, key: String) -> Result<String, JSONError> {
    guard let value = json[key] else {
        return .failure(.noSuchKey(key))
    }
    
    guard let value = value as? String else {
        return .failure(.typeMismatch)
    }

    return .success(value)
}

switch stringForKey(json, key: "email") {

case let .success(email):
    print("The email is \(email)")
    
case let .failure(.noSuchKey(key)):
    print("\(key) is not a valid key")
    
case .failure(.typeMismatch):
    print("Didn't have the right type")
}

// transforms a Result<Int, JSONError> to a Result<String, JSONError>
let idResult = intForKey(json, key:"id").map { id in String(id) }
