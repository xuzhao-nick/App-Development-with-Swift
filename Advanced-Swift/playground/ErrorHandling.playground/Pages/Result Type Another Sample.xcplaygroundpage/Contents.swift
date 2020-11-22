//: [Previous](@previous)

import Foundation

enum NetworkError: Error {
  case badURL
}


func fetchUnreadCount1(from urlString: String, completionHandler: @escaping (Result<Int, NetworkError>) -> Void ) {
  guard let url = URL(string: urlString) else {
    completionHandler(.failure(.badURL))
    return
  }
  
  // complicated networking code here
  print("Fetching \(url.absoluteString)...")
  completionHandler(.success(5))
}

fetchUnreadCount1(from: "") { result in
  switch result {
  case .success(let count):
    print("\(count) unread messages")
  case .failure(let error):
    print("error happened")
    print(error.localizedDescription)
  }
}


//Compare to traditional way handle different result
func fetchUnreadCount2(from urlString: String, completionHandler: @escaping (Int?, NetworkError?) -> Void) {
    guard let url = URL(string: urlString) else {
        completionHandler(nil, .badURL)
        return
    }

    print("Fetching \(url.absoluteString)...")
    completionHandler(5, nil)
}

//Another traditional way
func fetchUnreadCount3(from urlString: String, completionHandler: @escaping  (() throws -> Int) -> Void) {
    guard let url = URL(string: urlString) else {
        completionHandler { throw NetworkError.badURL }
        return
    }

    print("Fetching \(url.absoluteString)...")
    completionHandler { return 5 }
}

fetchUnreadCount3(from: "https://www.hackingwithswift.com") { resultFunction in
    do {
        let count = try resultFunction()
        print("\(count) unread messages.")
    } catch {
        print(error.localizedDescription)
    }
}
